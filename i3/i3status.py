# -*- coding: utf-8 -*-

import subprocess

from i3pystatus import Status
from i3pystatus.mail import notmuchmail

status = Status(standalone=True)

# Displays clock like this:
# Tue 30 Jul 11:59:46 PM KW31
#                          ^-- calendar week
status.register(
    "clock",
    format="%a %-d %b %H:%M:%S ",
)

status.register(
    "battery",
    battery_ident="ALL",
    format="{status} {percentage:0.0f}% {remaining}",
)

status.register(
    "disk",
    path="/",
    round_size=1,
    format="/:{used}/{total}",
)

status.register(
    "disk",
    path="/home",
    round_size=1,
    format="/home:{used}/{total}",
)

status.register(
    "disk",
    path="/media/sda3",
    round_size=1,
    format="/media/sda3:{used}/{total}",
)

status.register(
    "cpu_usage",
    format="CPU:{usage:02}%",
)

status.register(
    "mem",
    format="MEM:{avail_mem}M",
)

status.register(
    "swap",
    format="SWP:{free}M",
)

status.register(
    "mail",
    hide_if_null=False,
    backends=[notmuchmail.Notmuch(query="tag:inbox and tag:unread and -tag:spam")],
)

status.register(
    "network",
    format_up="{interface} u:{bytes_sent}KB/s d:{bytes_recv}KB/s",
    interface="wlp5s0",
)

_vpn_up_command = "sudo -A /bin/systemctl start openvpn-client@%(vpn_name)s.service"
_vpn_down_command = "sudo -A /bin/systemctl stop openvpn-client@%(vpn_name)s.service"

status.register(
    "openvpn",
    vpn_name="vpn-local",
    vpn_up_command=_vpn_up_command,
    vpn_down_command=_vpn_down_command,
    use_new_service_name=True,
)

status.register(
    "openvpn",
    vpn_name="vpn-all-traffic",
    vpn_up_command=_vpn_up_command,
    vpn_down_command=_vpn_down_command,
    use_new_service_name=True,
)

status.register("shell", command="dig +short myip.opendns.com @resolver1.opendns.com")

status.run()
