# -*- coding: utf-8 -*-

import subprocess

from i3pystatus import Status

status = Status(standalone=True)

status.register("cmus",)

status.register("spotify",)

status.register(
    "mpd",
    format="{title} - {artist} | Vol. {volume} | {song_elapsed}/{song_length} {status}",
    max_len=130,
    max_field_len=70,
    on_upscroll=["mpd_command", "volume +2"],
    on_downscroll=["mpd_command", "volume -2"])

status.run()
