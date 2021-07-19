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

    return _max, _min
```

- 다른 사람 풀이 1

```py
def solution(lottos, win_nums):

    rank=[6,6,5,4,3,2,1]

    # 0이 몇 번 나오는지 count
    cnt_0 = lottos.count(0)
    ans = 0
    for x in win_nums:
        if x in lottos:
            ans += 1
    return rank[cnt_0 + ans], rank[ans]
```

- 다른 사람 풀이 2

```py
def solution(lottos, win_nums):
    rank = {
        0: 6,
        1: 6,
        2: 5,
        3: 4,
        4: 3,
        5: 2,
        6: 1
    }
    return [rank[len(set(lottos) & set(win_nums)) + lottos.count(0)], rank[len(set(lottos) & set(win_nums))]]
```
