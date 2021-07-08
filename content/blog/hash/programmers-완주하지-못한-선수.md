---
title: Programmers 완주하지 못한 선수
date: 2021-07-08 15:07:62
category: hash
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/42576

## Solution

```py
import collections


def solution(participant, completion):
    answer = collections.Counter(participant) - collections.Counter(completion)
    return list(answer.keys())[0]
```
