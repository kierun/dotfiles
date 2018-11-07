#!/usr/bin/env python3
"""A simple password generator.

It is based on Terry Jones's `blog post
<http://blogs.fluidinfo.com/terry/2013/02/03/>`_

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

`The GNU Lesser General Public License is available here
<https://www.gnu.org/licenses/lgpl.html>`_ in case you need the full
length text.

"""
import base64
import getpass
import hashlib
import sys

__author__ = "Terry Jones, Yann Golanski"
__license__ = "LPGLv3"
__version__ = "1.1.0"


def genpwd():
    if len(sys.argv) != 2:
        sys.stderr.write("You need to provide a secret (say url) to get "
                         "a password generated...\n")
        return 1
    service = sys.argv[1]
    secret = getpass.getpass('Enter your master password: ')
    password = base64.b64encode(hashlib.sha512(secret.encode(
        'utf8') + service.encode('utf8')).digest())[:32]
    print('Your password on {0} is {1}'.format(service, password))
    return 0


if __name__ == "__main__":
    sys.exit(genpwd())
