#!/usr/bin/python3

from schedule import every, repeat, run_pending
import time
import os
import logging as log

log.basicConfig(
     filename="scheduler.log",
     encoding="utf-8",
     filemode="a",
     format="{asctime} - {levelname} - {message}",
     style="{",
     datefmt="%Y-%m-%d %H:%M",
     level=log.DEBUG
 )

@repeat(every().day.at("21:03"))
def remind_dinner():
    os.system("notify-send DINNERRR 'go remind ma-deuta' -u critical")

def remind_call_end():
    os.system("notify-send 'CUT THE CALL' 'dude stop doing that shit! you promised!' -u critical")

def stuff():
    print('fuck')

while True:
    run_pending()
    time.sleep(1)
