#!/usr/bin/python

import json
import fileinput
import re

domains = [
    r"amazon\.com",
    r"amazon\.es",
    r"youtube\.com",
    r"youtube\.es",
    r"google\.com",
    r"google\.es",
    r"cloud\.franpenedo\.com",
    r"duckduckgo\.com",
    r"localhost:.+",
    r"192\.168\..+",
    r"4chan\.org",
    r"4channel\.org",
    r"netflix\.com",
    r"dynasty-scans\.com",
    r"mangadex\.org",
    r"fastmail\.com",
    r"messenger\.com",
    r"twitch\.tv",
    r"startpage\.com",
    r"bing\.com",
    r"fanfiction\.net",
    r"bloomberg\.com",
]

domains_re = "|".join([f"({dom})" for dom in domains])
blacklist = f"http(s)?:\\/\\/(.+)?{domains_re}\\/.*"
blacklist_c = re.compile(blacklist, re.IGNORECASE | re.UNICODE | re.MULTILINE)

for line in fileinput.input():
    links = json.loads(line)
    print(
        json.dumps(
            [link for link in links if not bool(blacklist_c.search(link["href"]))]
        )
    )
