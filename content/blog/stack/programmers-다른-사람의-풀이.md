---
title: Programmers 다른 사람의 풀이
date: 2021-08-01 23:08:11
category: stack
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/42587

## Solution

```py
from collections import deque


def solution(priorities, location):
    queue = deque([(b, a) for a, b in enumerate(priorities)])

    answer = 1
    while queue:
        if queue[0][0] == max(queue)[0]:
            if queue[0][1] == location:
                return answer
            queue.popleft()
            answer += 1
        else:
            queue.append(queue.popleft())
    return answer
```

- 다른 사람 풀이

```py
def solution(priorities, location):
    queue =  [(i,p) for i,p in enumerate(priorities)]
    answer = 0
    while True:
        cur = queue.pop(0)
        if any(cur[1] < q[1] for q in queue):
            queue.append(cur)
        else:
            answer += 1
            if cur[0] == location:
                return answer
```
