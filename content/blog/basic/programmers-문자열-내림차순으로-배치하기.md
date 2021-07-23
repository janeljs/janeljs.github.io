---
title: Programmers 문자열 내림차순으로 배치하기
date: 2021-07-24 03:07:89
category: basic
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12917

## Solution

```py
def solution(s):
    return ''.join(sorted(s, reverse= True))
```
