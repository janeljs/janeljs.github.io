---
title: Programmers 다음 큰 숫자
date: 2021-07-26 02:07:47
category: basic
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12911

## Solution

```py
def solution(n):
    save = n
    while True:
        next = n + 1
        if bin(next).count("1") == bin(save).count("1"):
            return next
        else:
            n += 1
```
