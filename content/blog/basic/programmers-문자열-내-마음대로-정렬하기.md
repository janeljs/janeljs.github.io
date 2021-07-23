---
title: Programmers 문자열 내 마음대로 정렬하기
date: 2021-07-24 02:07:45
category: basic
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12915

## Solution

```py
def solution(strings, n):
    return sorted(sorted(strings), key=lambda x: x[n])
```
