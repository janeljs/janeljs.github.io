---
title: Programmers 최솟값 만들기
date: 2021-07-26 00:07:58
category: basic
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12941

## Solution

```py
def solution(A, B):
    A.sort()
    B.sort(reverse=True)
    return sum(a * b for a, b in zip(A, B))
```
