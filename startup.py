# noqa: pylint disable:invalid-name,superfluous-parens
"""Ned's startup.py file, loaded into interactive python prompts.

This has to work on both 2.x and 3.x
"""
import collections
import datetime
import itertools
import math
import os
import pprint
import re
import sys
import time

print("(~/.startup.py)")

print("(imported collections, datetime, itertools, math, os, pprint, re, sys, time)")  # noqa

pp = pprint.pprint


def paste():
    """A function for pasting code into the repl."""
    import textwrap
    exec(textwrap.dedent(sys.stdin.read()), globals())


def hook_up_history():
    """Readline and history support."""
    try:
        # Not sure why this module is missing in some places, but deal with it.
        import readline
    except ImportError:
        print("No readline, use ^H")
    else:
        import atexit
        import rlcompleter

        history_path = os.path.expanduser(
            "~/.pyhistory{0}".format(sys.version_info[0])
        )

        def save_history(history_path=history_path):
            import readline
            readline.write_history_file(history_path)

        if os.path.exists(history_path):
            readline.read_history_file(history_path)

        atexit.register(save_history)


# Don't do history stuff if we are IPython, it has its own thing.
is_ipython = 'In' in globals()
if not is_ipython:
    hook_up_history()

# Get rid of globals we don't want.
del is_ipython, hook_up_history
