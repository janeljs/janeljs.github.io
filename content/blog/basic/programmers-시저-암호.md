---
title: Programmers 시저 암호
date: 2021-07-24 04:07:63
category: basic
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12926

## Solution

```py
def solution(s, n):
    answer = list(s)
    for i in range(len(s)):
        if s[i].isupper():
            answer[i] = chr((ord(s[i]) + n - ord('A')) % 26 + ord('A'))
        elif s[i].islower():
            answer[i] = chr((ord(s[i]) + n - ord('a')) % 26 + ord('a'))
    return ''.join(answer)

```
