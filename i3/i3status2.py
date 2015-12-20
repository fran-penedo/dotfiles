# -*- coding: utf-8 -*-

import subprocess

from i3pystatus import Status

status = Status(standalone=True)

status.register("cmus",)

status.register("spotify",)

status.register("mpd", format="{status} {song_elapsed}/{song_length} {artist} - {title}",
                on_upscroll="", on_downscroll="")

status.run()
