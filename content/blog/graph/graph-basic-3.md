---
title: 이코테 Chapter 10 그래프 이론 (3)
date: 2021-02-20 03:02:91
category: graph
thumbnail: { thumbnailSrc }
draft: false
---

## 위상 정렬(Topology Sort)

- 방향 그래프의 모든 노드를 방향성에 거스르지 않도록 순서대로 나열하는 것
- 진입차수: 특정한 노드로 들어오는 간선의 개수

### 동작 과정

1. 진입차수가 0인 노드를 큐에 넣는다.
2. 큐에서 원소를 꺼내 해당 노드에서 출발하는 간선을 그래프에서 제거한다.
3. 새롭게 진입차수가 0이된 노드를 큐에 넣는다.
4. 큐가 빌 때까지 2번과 3번을 반복한다.

❗ 원소가 V번 추출되기 전에 큐가 빈다면 사이클이 존재하는 것이다.

### 구현

- 시간복잡도: $O(V+E)$

```py
from collections import deque

v, e = map(int, input().split())
indegree = [0] * (v + 1)  # 진입차수

graph = [[] for i in range(v + 1)]

for _ in range(e):
    a, b = map(int, input().split())
    graph[a].append(b)
    indegree[b] += 1


def topology_sort():
    result = []
    q = deque()

    for i in range(1, v + 1):
        if indegree[i] == 0:
            q.append(i)

    while q:
        now = q.popleft()
        result.append(now)
        for i in graph[now]:
            indegree[i] -= 1
            # 진입차수가 0이되는 노드를 큐에 삽입
            if indegree[i] == 0:
                q.append(i)

    for i in result:
        print(i, end=' ')


topology_sort()

```

### Input

```py
7 8
1 2
1 5
2 3
2 6
3 4
4 7
5 6
6 4
```

### Output

```py
1 2 5 3 6 4 7
```

### 참고

### deque

- 파이썬에서는 queue를 구현할 때 보통 deque를 이용한다.
- 리스트와 다르게 인덱싱, 슬라이싱이 불가하다.
- 시작 또는 끝 부분에 데이터를 삽입하거나 삭제할 때 효과적이다.
- 스택이나 큐의 기능을 모두 갖추고 있기 때문에 스택이나 큐 대용으로 사용될 수 있다.
  &rarr; 큐로 이용하고 싶은 경우 삽입 시에는 append(), 삭제 시에는 popleft()를 사용하면 된다.

### deque 메서드

| name          | description                      |
| ------------- | -------------------------------- |
| pop()         | 마지막 원소를 제거한 뒤 반환     |
| popleft()     | 첫 번째 원소를 제거한 뒤 반환    |
| append(x)     | deque 오른쪽에 x 삽입            |
| appendleft(x) | deque 왼쪽에 x 삽입              |
| clear()       | deque의 모든 원소를 제거         |
| copy()        | deque의 shallow copy를 생성      |
| count(x)      | x와 같은 deque element의 수 계산 |

- 예제

```py
from collections import deque

a = deque([1, 2, 3, 3, 3, 5, 5, 7])
a.appendleft(9)
a.append(10)

print(list(a))
```

```py
# result
[9, 1, 2, 3, 3, 3, 5, 5, 7, 10]
```

### 시간복잡도

|                            | list   | deque  |
| -------------------------- | ------ | ------ |
| 가장 앞쪽에 원소 추가      | $O(N)$ | $O(1)$ |
| 가장 뒤쪽에 원소 추가      | $O(1)$ | $O(1)$ |
| 가장 앞쪽에 있는 원소 제거 | $O(N)$ | $O(1)$ |
| 가장 뒤쪽에 있는 원소 제거 | $O(1)$ | $O(1)$ |

#

**_Source_**

- https://github.com/ndb796/python-for-coding-test
