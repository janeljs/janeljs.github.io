---
title: Programmers 정수 제곱근 판별
date: 2021-07-24 13:07:71
category: basic
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12934

## Solution

```py
def solution(n):
    sqrt = n ** 0.5
    if sqrt % 1 == 0:
        return (sqrt + 1) ** 2
    else:
        return -1
```
