---
title: Programmers 실패율
date: 2021-07-19 09:07:09
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/42889

## Solution

```py
from collections import Counter

def solution(N, stages):
    challenger_count = len(stages)
    counter = Counter(stages)
    rate = dict()

    for stage in range(1, N+1):
        if challenger_count != 0:
            stage_count = counter[stage]
            rate[stage] = stage_count / challenger_count
            challenger_count -= stage_count
        else:
            rate[stage] = 0

    return sorted(rate, key=rate.get, reverse = True)
```

- 다른 사람 풀이 1

```py
def solution(N, stages):
    fail = {}
    for i in range(1,N+1):
        try:
            fail_ = len([a for a in stages if a==i])/len([a for a in stages if a>=i])
        except:
            fail_ = 0
        fail[i]=fail_
    answer = sorted(fail, key=fail.get, reverse=True)
    return answer
```

- 다른 사람 풀이 2

```py
def solution(N, stages):
    result = {}
    denominator = len(stages)
    for stage in range(1, N+1):
        if denominator != 0:
            count = stages.count(stage)
            result[stage] = count / denominator
            denominator -= count
        else:
            result[stage] = 0
    return sorted(result, key=lambda x : result[x], reverse=True)
```

- 다른 사람 풀이 3

```py
def solution(N, stages):
    answer = []
    fail = []
    info = [0] * (N + 2)
    for stage in stages:
        info[stage] += 1
    for i in range(N):
        be = sum(info[(i + 1):])
        yet = info[i + 1]
        if be == 0:
            fail.append((str(i + 1), 0))
        else:
            fail.append((str(i + 1), yet / be))
    for item in sorted(fail, key=lambda x: x[1], reverse=True):
        answer.append(int(item[0]))
    return answer
```
