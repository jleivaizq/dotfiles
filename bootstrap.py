#!/usr/bin/env python
#
# Bootstrap script
# ===========================================

import glob
import os


# Path to this file
SELF_PATH = os.path.dirname(os.path.abspath(__file__))


def create_symlinks():
    'Create the symlinks on user home'
    symlinks = glob.glob('*/*.symlink')
    always_overwrite = False

    for symlink in symlinks:
        origin = os.path.join(SELF_PATH, symlink)

        filename = '.' + os.path.splitext(os.path.basename(symlink))[0]
        destine = os.path.expanduser(os.path.join('~', filename))

        if os.path.lexists(destine):

            # Ask the user if overwrite the file
            if not always_overwrite:
                answer = confirm_overwrite(destine)
                always_overwrite = answer == 'a'

            # Remove the file if the user answered yes
            if always_overwrite or answer in ('y', 'a'):
                os.remove(destine)

            # Keep the file if the user answered no
            if answer == 'n':
                continue

        # Create the symlink
        os.symlink(origin, destine)


def confirm_overwrite(path):
    'Ask the user to overwrite a file'
    while True:
        answer = input('%s exists, overwrite it? (a/y/n) ' % os.path.basename(path))

        if answer in ('y', 'n', 'a'):
            break

    return answer


if __name__ == '__main__':
    os.chdir(SELF_PATH)
    create_symlinks()
