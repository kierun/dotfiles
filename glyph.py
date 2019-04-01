#!/usr/bin/env python
# -*- coding: utf-8 -*-
# http://www.fileformat.info/info/unicode/char/search.htm

lst = [u"\u263A",  # ☺
       u"\u2368",  # ⍨
       u'\u2639',  # ☹
       u'\u2622',  # ☢
       u'\u2623',  # ☣
       u'\u2620',  # ☠
       u'\u2744',  # ❄
       u'\u26A0',  # ⚠
       u'\u2192',  # →
       u'\u2190',  # ←
       u"\u2191",  # ↑
       u"\u2193",  # ↓
       u"\u2665",  # ♥
       u"\u00DC",  # Ü
       u"\u00FC",  # ü
       u"死",      # Death / shi
       u"隻狼",    # One Armed Wolf / Sekirom
       u"¯\_(ツ)_/¯"  # shrugs.
       ]
for c in lst:
    print(u'  {} '.format(c))
