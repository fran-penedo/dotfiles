# -*- coding: utf-8 -*-

import subprocess

from i3pystatus import Status, now_playing


class MyNowPlaying(now_playing.NowPlaying):
    def __init__(self):
        _format = (
            "{title} - {artist} | Vol. {volume} | {song_elapsed}/{song_length} {status}"
        )
        super().__init__(format=_format)

    def volume_up(self):
        self.set_player_prop("Volume", self.volume + 0.02)

    def volume_down(self):
        self.set_player_prop("Volume", self.volume - 0.02)


status = Status(standalone=True)

status.register(MyNowPlaying())

status.register(
    "mpd",
    format="{title} - {artist} | Vol. {volume} | {song_elapsed}/{song_length} {status}",
    max_len=130,
    max_field_len=70,
    on_upscroll=["mpd_command", "volume +2"],
    on_downscroll=["mpd_command", "volume -2"],
)

status.run()
