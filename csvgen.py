#!/usr/bin/python
import csv
import random
import time

records=90
print("Making %d records\n" % records)

fieldnames=['timestamp','location','product','condition','age','start_weight','end_weight']
writer = csv.DictWriter(open("sample.csv", "w"), fieldnames=fieldnames)

location=['NJ', 'NY', 'CT', 'PA']
product=['abc01', 'xyz03', 'xyz02', 'abc02','qwe01']
condition=['good','bad','ok']

writer.writerow(dict(zip(fieldnames, fieldnames)))
for i in range(0, records):
  writer.writerow(dict([
    ('timestamp', time.strftime("%Y-%m-%d %H:%M:%S")),
    ('location', random.choice(location)),
    ('product', random.choice(product)),
    ('condition', random.choice(condition)),
    ('age', int(random.randint(1,5))),
    ('start_weight', int(random.randint(10,15))),
    ('end_weight', int(random.randint(10,15)))]))

