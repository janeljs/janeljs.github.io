---
title: Programmers 문자열 다루기 기본
date: 2021-07-24 03:07:34
category: basic
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12918

## Solution

```py
def solution(s):
    return s.isdigit() and (len(s) == 4 or len(s) == 6)
```
