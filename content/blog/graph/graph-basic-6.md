---
title: 이코테 Chapter 10 그래프 실전 문제 (3)
date: 2021-02-24 15:02:72
category: graph
thumbnail: { thumbnailSrc }
draft: false
---

## 실전 문제 3: 커리큘럼

## Testcase

```py
5
10 -1
10 1 -1
4 1 -1
4 3 1 -1
3 3 -1
# 10
# 20
# 14
# 18
# 17
```

## Solution

- [deep copy 관련 설명 링크](https://velog.io/@aonee/Python-%EC%9E%90%EB%A3%8C%ED%98%95%EC%9D%98-%EA%B0%92-%EC%A0%80%EC%9E%A5-%EB%B3%B5%EC%82%AC-copy)
- 각 강의 번호는 1부터 N까지 구성되며 동시에 여러 개의 강의를 들을 수 있다는 조건을 놓치지 말자.
- time을 저장하는 리스트를 따로 만들 생각을 못했다. 잘 모르겠어서 해설을 보고 다시 풀어봤다.

```py
from collections import deque
import copy

v = int(input())

indegree = [0] * (v + 1)

graph = [[] for i in range(v + 1)]

time = [0] * (v + 1)

for i in range(1, v + 1):
    data = list(map(int, input().split()))
    time[i] = data[0]
    for x in data[1:-1]:
        indegree[i] += 1
        graph[x].append(i)


def topology_sort():
    result = copy.deepcopy(time)
    q = deque()

    for i in range(1, v + 1):
        if indegree[i] == 0:
            q.append(i)

    while q:
        now = q.popleft()
        for i in graph[now]:
            result[i] = max(result[i], result[now] + time[i])
            indegree[i] -= 1
            if indegree[i] == 0:
                q.append(i)

    for i in range(1, v + 1):
        print(result[i])


topology_sort()
```

#

**_Source_**

- https://github.com/ndb796/python-for-coding-test
