---
title: Programmers 로또의 최고 순위와 최저 순위
date: 2021-07-19 16:07:87
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/77484

## Solution

```py
def solution(lottos, win_nums):
    _max = 7
    _min = 7

    for l in lottos:
        if l == 0:
            _max -= 1
        else:
            if l in win_nums:
                _max -= 1
                _min -= 1

    if _max == 7:
        _max = 6

    if _min == 7:
        _min = 6

    return [_max, _min]
```
