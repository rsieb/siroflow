#!/usr/local/bin/python

import myfitnesspal
import time
from datetime import date
from datetime import timedelta

start_date = date(2013,11,15)
#start_date = date.today()
end_date = date.today()

client= myfitnesspal.Client('siros123','fuafgiab')


def daterange(start_date, end_date):
    for n in range(int ((end_date - start_date).days)):
        yield start_date + timedelta(n)

for single_date in daterange(start_date, end_date):
    # print single_date.timetuple()
    day = ""
    #day = client.get_date(single_date.year,single_date.month,single_date.day)
    day = client.get_date(single_date)
    print day

