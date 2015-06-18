# -*- coding: utf-8 -*-

import subprocess

from i3pystatus import Status
from i3pystatus.mail import maildir

status = Status(standalone=True)

# Displays clock like this:
# Tue 30 Jul 11:59:46 PM KW31
#                          ^-- calendar week
status.register("clock",
                format="%a %-d %b %H:%M:%S ",)

status.register("battery",
                battery_ident="BAT1",
                format="{status} {percentage:0.0f}% {remaining}",)

status.register("disk", path="/", round_size=1,
                format="/:{used}/{total}",)

status.register("disk", path="/home", round_size=1,
                format="/home:{used}/{total}",)


status.register("cpu_usage",
                format="CPU:{usage:02}%",)

status.register("mem",
                format="MEM:{used_mem}M",)

status.register("mail", hide_if_null=False,
                backends=[maildir.MaildirMail(directory="/home/fran/mail/personal/archive", account="personal"),
                          maildir.MaildirMail(directory="/home/fran/mail/bu/archive", account="bu")])

status.register("network",
                format_up="{interface} u:{bytes_sent}KB/s d:{bytes_recv}KB/s",
                interface="wlp5s0")

status.run()
