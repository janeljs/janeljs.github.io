---
title: Programmers n진수 게임
date: 2021-07-26 02:07:75
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/17687

## Solution

- 0을 빼먹어서 한참 헤맸다. 왜 n진수 게임을 하는지도 모르겠고, 왜 0부터 시작하는지도 모르겠다.

```py
def solution(n, t, m, p):
    temp = ''
    for i in range(t * m):
        temp += dec_to_n(i, n)
    tube = ''
    for j in range(p - 1, t * m, m):
        tube += temp[j]
    return tube


def dec_to_n(number, n):
    str = "0123456789ABCDEF"
    rev_base = ''
    if number == 0:
        return '0'
    while number > 0:
        number, mod = divmod(number, n)
        rev_base += str[mod]
    return rev_base[::-1]
```
