#!/usr/bin/python3

# Stop Working and Start Planning

import os
import time
from schedule import repeat, every, run_pending, run_all

@repeat(every().day.at("20:00"))
def plan_the_fucking_day():
    os.system("notify-send 'Stop Working' 'and start planning' -u critical")

run_all()

while True:
    run_pending()
    time.sleep(1)
