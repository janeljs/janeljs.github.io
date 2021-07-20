---
title: Programmers 2016년
date: 2021-07-19 13:07:78
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12901

## Solution

- [Python Datetime](https://www.w3schools.com/python/python_datetime.asp)

```py
import datetime

def solution(a, b):
    return datetime.datetime(2016, a, b).strftime("%a").upper()
```

- 다른 사람 풀이

```py
def getDayName(a,b):
    months = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    days = ['FRI', 'SAT', 'SUN', 'MON', 'TUE', 'WED', 'THU']
    return days[(sum(months[:a-1])+b-1)%7]

print(getDayName(5,24))
```
