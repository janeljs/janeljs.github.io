---
title: Programmers 제일 작은 수 제거하기
date: 2021-07-25 00:07:99
category: basic
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12935

## Solution

```py
def solution(arr):
    min_value = min(arr)
    arr.remove(min_value)
    return arr if arr else [-1]
```
