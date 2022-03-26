#!/usr/bin/env python

# code from https://github.com/afewmail/afew

import os
import sys
import uuid


def get_new_name(fname, destination):
    basename = os.path.basename(fname)
    submaildir = os.path.split(os.path.split(fname)[0])[1]
    parts = basename.split(":")
    if len(parts) > 1:
        flagpart = ":" + parts[-1]
    else:
        flagpart = ""
        # construct a new filename, composed of a made-up ID and the flags part
        # of the original filename.
    basename = str(uuid.uuid1()) + flagpart
    return os.path.join(destination, submaildir, basename)


print(get_new_name(sys.argv[1], ""))
