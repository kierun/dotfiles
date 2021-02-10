#!/usr/bin/env python
# -*- coding: utf-8 -*-
# http://www.fileformat.info/info/unicode/char/search.htm

lst = [u"\u263A",       # ☺
       u"\u2368",       # ⍨
       u'\u2639',       # ☹
       u'\u2622',       # ☢
       u'\u2623',       # ☣
       u'\u2620',       # ☠
       "💀",            # Skull.
       u'\u2744',       # ❄
       u'\u26A0',       # ⚠
       u'\u2192',       # →
       u'\u2190',       # ←
       u"\u2191",       # ↑
       u"\u2193",       # ↓
       u"\u2665",       # ♥
       u"\u00DC",       # Ü
       u"\u00FC",       # ü
       u"\u266C",       # ♬
       u"\u2623",       # ☣ Biohazard
       u"死",           # Death / shi
       u"隻狼",         # One Armed Wolf / Sekirom
       u"\u26E9"        # Tori gate.
       u"gå agurk",     # to run amok, to go berserk, lit. “to go cucumber”.
       u"\u2234"        # ∴, Therefore.
       "    ¯\_(ツ)_/¯",    # shrugs.
       ]
count = 0
for x in range(0, len(lst)):
    print(u'{cha:{fill}{align}{width}}'.format(cha=lst[x], fill=' ',
        align='<', width=12), end="")
    count += 1
    if count > 4:
        print("")
        count = 0
print("")
