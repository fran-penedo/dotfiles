#!/usr/bin/python

import os
import sys
import re
import traceback
from email.parser import BytesParser
from email.policy import default

import requests
import keyring

RSSIFY_ALL = False

DIR = "/home/fran/mail/personal/rss/cur/"
OUT_DIR = "/home/fran/fserver/email_rss/"
RSSIFY_URL = "http://10.111.0.1/rssify/add"
OUT_SERVER = "fserver-vpn"
OUT_SERVER_DIR = "/home/fran/email_rss/"
NEXTCLOUD_NEWS_API_URL = "https://cloud.franpenedo.com/apps/news/api/v1-2/feeds"
NEXTCLOUD_USER = "fran"
NEXTCLOUD_PASS = keyring.get_password("cloud.franpenedo.com", "fran")

SUBJECT_REGEX = re.compile(r"^Subject: (.*)", re.MULTILINE)
SUBJECT_EXTRACTORS = [r"^Chapter: (.*) Ch[0-9]+ .*"]
SUBJECT_EXTRACTORS = [re.compile(e) for e in SUBJECT_EXTRACTORS]


mail_map = {}

for fn in os.listdir(DIR):
    with open(os.path.join(DIR, fn), "rb") as f:
        email = BytesParser(policy=default).parse(f)
        subject = email["subject"]
        for ext in SUBJECT_EXTRACTORS:
            m = ext.match(subject)
            if m:
                mails = mail_map.setdefault(m.group(1), [])
                mails.append(email)
                break

for title, mails in mail_map.items():
    try:
        rssify_add = False
        out_fn = f"{mails[0]['from'].addresses[0].addr_spec} - {title}.xml"
        out_path = os.path.join(OUT_DIR, out_fn)
        if not os.path.exists(out_path):
            rssify_add = True
        with open(out_path, "w") as f:
            f.write(f"<name>{title}</name>\n")
            for mail in mails:
                f.write(
                    f"<mail>\n<date>{mail['date']}</date>\n{mail.get_body().get_content()}</mail>\n"
                )
        escaped_target_fn = os.path.join(OUT_SERVER_DIR, out_fn).replace(" ", "\\ ")
        os.system(f'scp "{out_path}" {OUT_SERVER}:"{escaped_target_fn}" > /dev/null')
        if RSSIFY_ALL or rssify_add:
            r = requests.post(
                RSSIFY_URL,
                json={"url": f"file://{os.path.join(OUT_SERVER_DIR, out_fn)}"},
            )
            if not r.json()["added"] and not RSSIFY_ALL:
                print(
                    f"Failed to rssify {title}: {r.json()['reason']}", file=sys.stderr
                )
            else:
                nextcloud_r = requests.post(
                    NEXTCLOUD_NEWS_API_URL,
                    json={
                        "url": r.json()["link"],
                        "folderId": 0,
                    },
                    auth=(NEXTCLOUD_USER, NEXTCLOUD_PASS),
                )
                if nextcloud_r.status_code != 200:
                    print(
                        f"Failed to add feed {r.json()['link']} to nextcloud news: request status code {nextcloud_r.status_code}",
                        file=sys.stderr,
                    )
                    if nextcloud_r.status_code == 400:
                        print(nextcloud_r.text, file=sys.stderr)
    except Exception as e:
        traceback.print_exc()
