---
title: Programmers 뉴스 클러스터링
date: 2021-08-01 23:08:02
category: string
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/17677

## Solution

```py
def solution(str1, str2):
    answer = 0
    str1 = str1.lower()
    str2 = str2.lower()
    s1 = []
    s2 = []

    for i in range(len(str1) - 1):
        string = str1[i] + str1[i + 1]
        if string.isalpha():
            s1.append(string)
    for i in range(len(str2) - 1):
        string = str2[i] + str2[i + 1]
        if string.isalpha():
            s2.append(string)

    s12 = s1 + s2

    s1_len_before = len(s1)
    for i in s2:
        if i in s1:
            s1.remove(i)
    s1_len_after = len(s1)

    intersection_count = s1_len_before - s1_len_after
    union_count = len(s1 + s2)
    return int(intersection_count / union_count * 65536) if union_count != 0 else 65536
```

- 다른 사람 풀이

```py
import re
import math

def solution(str1, str2):
    str1 = [str1[i:i+2].lower() for i in range(0, len(str1)-1) if not re.findall('[^a-zA-Z]+', str1[i:i+2])]
    str2 = [str2[i:i+2].lower() for i in range(0, len(str2)-1) if not re.findall('[^a-zA-Z]+', str2[i:i+2])]

    gyo = set(str1) & set(str2)
    hap = set(str1) | set(str2)

    if len(hap) == 0 :
        return 65536

    gyo_sum = sum([min(str1.count(gg), str2.count(gg)) for gg in gyo])
    hap_sum = sum([max(str1.count(hh), str2.count(hh)) for hh in hap])

    return math.floor((gyo_sum/hap_sum)*65536)
```
