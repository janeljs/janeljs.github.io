---
title: Programmers 평균 구하기
date: 2021-07-25 00:07:12
category: basic
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12944

## Solution

```py
def solution(arr):
    return sum(arr) / len(arr)
```

- reduce 이용

```py
from functools import reduce
def average(list):
    return reduce(lambda x, y : x + y, list) / len(list)
```
