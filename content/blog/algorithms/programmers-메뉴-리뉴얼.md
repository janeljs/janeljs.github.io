---
title: Programmers 메뉴 리뉴얼
date: 2021-08-07 02:08:03
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/72411

## Solution

```py
from itertools import combinations
from collections import Counter


def solution(orders, course):
    answer = []
    for c in course:
        combs = []
        for order in orders:
            # 요리 개수에 해당하는 모든 조합을 구한다.
            combs += combinations(sorted(order), c)
        counter = Counter(combs)
        # 최소 2명 이상의 손님으로부터 주문된 메뉴라면
        if counter and max(counter.values()) >= 2:
            # 가장 많이 주문된 조합만 코스 후보에 추가한다.
            answer += [''.join(x) for x in counter if counter[x] == max(counter.values())]
    return sorted(answer)
```

- 다른 사람 풀이

```py
import collections
import itertools

def solution(orders, course):
    result = []

    for course_size in course:
        order_combinations = []
        for order in orders:
            order_combinations += itertools.combinations(sorted(order), course_size)

        most_ordered = collections.Counter(order_combinations).most_common()
        result += [ k for k, v in most_ordered if v > 1 and v == most_ordered[0][1] ]

    return [ ''.join(v) for v in sorted(result) ]
```
