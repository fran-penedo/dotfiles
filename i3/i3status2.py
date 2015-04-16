# -*- coding: utf-8 -*-

import subprocess

from i3pystatus import Status

status = Status(standalone=True)

status.register("cmus",)

status.register("spotify",)

status.run()
