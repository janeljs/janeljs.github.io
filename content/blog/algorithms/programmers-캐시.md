---
title: Programmers 캐시
date: 2021-09-11 21:09:13
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/17680

## Solution

```py
from collections import deque


def solution(cacheSize, cities):
    cache = deque()

    time = 0
    for city in cities:
        city = city.lower()

        if city in cache:
            cache.remove(city)
            time += 1
        else:
            if cacheSize == 0:
                time += 5
                continue
            if len(cache) == cacheSize:
                cache.popleft()
            time += 5
        cache.append(city)
    return time
```

- 다른 사람 풀이

```py
def solution(cacheSize, cities):
    import collections
    cache = collections.deque(maxlen=cacheSize)
    time = 0
    for i in cities:
        s = i.lower()
        if s in cache:
            cache.remove(s)
            cache.append(s)
            time += 1
        else:
            cache.append(s)
            time += 5
    return time
```
