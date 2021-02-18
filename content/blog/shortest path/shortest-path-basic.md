---
title: 이코테 Chapter 9 최단 경로 (1)
date: 2021-02-14 04:02:46
category: shortest path
thumbnail: { thumbnailSrc }
draft: false
---

# 최단 경로 알고리즘

- 가장 짧은 경로를 찾는 알고리즘
  &rarr; Weighted Graph에서 Edge의 가중치 합이 최소가 되는 경로를 찾는 것이 목적이다.
- 그리디 알고리즘과 다이나믹 프로그래밍 알고리즘이 적용된다.

## 다익스트라 최단 경로 알고리즘

- 그래프에서 여러 개의 노드가 있을 때, 특정한 노드에서 출발하여 다른 노드로 가는 각각의 최단 경로를 구해주는 알고리즘
- 매번 최단 거리 테이블을 선형적으로 탐색한다.
- single-source shortest path problem
- 그리디 알고리즘
- 동작 과정
  1. 출발 노드를 설정한다.
  2. 최단 거리 테이블(1차원 리스트)을 초기화한다.  
     &rarr; 출발 노드에서 다른 모든 노드로 가는 최단 거리를 무한`int(1e9)`으로 초기화
  3. 방문하지 않은 노드 중에서 최단 거리가 가장 짧은 노드를 선택한다.
  4. 해당 노드를 거쳐 다른 노드로 가는 비용을 계산하여 최단 거리 테이블을 갱신한다.
  5. 위 과정에서 3번과 4번을 반복한다.

### 구현

- 시간복잡도: $O(V^2)$
- dijkstra(initial_node) 내부 for문의 층위를 잘못 설정해서 한참 헤맸다.
- 교재에 나와있는 변수명이 명확하지 않아 조금 수정해보았다.

```py
import sys

input = sys.stdin.readline
INF = int(1e9)

n, m = map(int, input().split())  # 노드, 간선의 수
initial_node = int(input())  # 출발 노드 번호
graph = [[] for i in range(n + 1)]
visited = [False] * (n + 1)
distances = [INF] * (n + 1)

for _ in range(m):
    a, b, c = map(int, input().split())  # c: a와 b 사이의 거리
    graph[a].append((b, c))


def get_node_with_shortest_distance():
    min_value = INF
    index = 0  # 가장 최단 거리가 짧은 노드
    for i in range(1, n + 1):
        if distances[i] < min_value and not visited[i]:
            min_value = distances[i]
            index = i
    return index


def dijkstra(initial_node):
    distances[initial_node] = 0
    visited[initial_node] = True
    for j in graph[initial_node]:
        distances[j[0]] = j[1]
    for i in range(n - 1):
        current_node = get_node_with_shortest_distance()
        visited[current_node] = True
        for j in graph[current_node]:
            distance = distances[current_node] + j[1]
            if distance < distances[j[0]]:
                distances[j[0]] = distance


dijkstra(initial_node)

for i in range(1, n + 1):
    if distances[i] == INF:
        print("INFINITY")
    else:
        print(distances[i])
```

### Input

```py
6 11
1
1 2 2
1 3 5
1 4 1
2 3 3
2 4 2
3 2 3
3 6 5
4 3 3
4 5 1
5 3 1
5 6 2
```

### Output

```py
0
2
3
1
2
4
```

<br/>

## 개선된 다익스트라 알고리즘

- 힙 자료구조 사용 &rarr; 출발 노드로부터 가장 거리가 짧은 노드를 찾는데 로그 시간이 소요된다. (vs. 다익스트라 알고리즘: $O(V)$)

  - 파이썬에서는 일반적으로 PriorityQueue보다 heapq가 더 빠르게 동작한다.
  - 파이썬과 자바에서는 기본적으로 Min Heap을 이용하여 우선순위 라이브러리가 구현되어 있다.

### 구현 1

- 시간복잡도 : $O(ElogV)$
- 모든 간선을 힙에 넣었다가 다시 뺀다면 시간복잡도는 $O(ElogE)$이다.
- 모든 노드가 연결되어 있을 때 간선의 수는 $V^2$이기 때문에 $logE$는 항상 $logV^2$보다 작다.
- 따라서 개선된 다익스트라 알고리즘의 시간복잡도는 $O(ElogV)$라고 할 수 있다.

```py
import heapq
import sys

input = sys.stdin.readline
INF = int(1e9)

n, m = map(int, input().split())
start = int(input())
graph = [[] for i in range(n + 1)]

distance = [INF] * (n + 1)

for _ in range(m):
    a, b, c = map(int, input().split())
    graph[a].append((b, c))


def dijkstra(start):
    queue = []
    heapq.heappush(queue, (0, start))
    distance[start] = 0

    while queue:
        dist, now = heapq.heappop(queue)
        if distance[now] < dist:
            continue
        for i in graph[now]:
            cost = dist + i[1]
            if cost < distance[i[0]]:
                distance[i[0]] = cost
                heapq.heappush(queue, (cost, i[0]))


dijkstra(start)

for i in range(1, n + 1):
    if distance[i] == INF:
        print("INFINITY")
    else:
        print(distance[i])
```

### 구현 2

- 거의 위와 똑같은 로직인데 변수명이 더 잘 정의되어 있다.

```py
import heapq


def dijkstra(graph, start):
    distances = {node: float('inf') for node in graph}
    distances[start] = 0
    queue = []
    heapq.heappush(queue, [distances[start], start])

    while queue:
        current_distance, current_node = heapq.heappop(queue)
        if distances[current_node] < current_distance:
            continue
        for adjacent, weight in graph[current_node].items():
            distance = current_distance + weight
            if distance < distances[adjacent]:
                distances[adjacent] = distance
                heapq.heappush(queue, [distance, adjacent])

    return distances


mygraph = {
    'A': {'B': 8, 'C': 1, 'D': 2},
    'B': {},
    'C': {'B': 5, 'D': 2},
    'D': {'E': 3, 'F': 5},
    'E': {'F': 1},
    'F': {'A': 5}
}

print(dijkstra(mygraph, 'A'))

# Result: {'A': 0, 'B': 6, 'C': 1, 'D': 2, 'E': 5, 'F': 6}

```

#

**_Source_**

- https://github.com/ndb796/python-for-coding-test
- https://www.fun-coding.org/Chapter20-shortest-live.html
