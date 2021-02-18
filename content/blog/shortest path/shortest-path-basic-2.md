---
title: 이코테 Chapter 9 최단 경로 (2)
date: 2021-02-18 21:02:28
category: shortest path
thumbnail: { thumbnailSrc }
draft: false
---

## 플로이드 워셜 알고리즘

- 모든 지점에서 다른 모든 지점까지의 최단 경로를 모두 구해야 하는 경우 사용하는 알고리즘
- 다이나믹 프로그래밍
- 2차원 리스트에 최단 거리 정보를 저장한다.

### 구현

- 시간복잡도 : $O(N^3)$

```py
INF = int(1e9)

n = int(input())
m = int(input())

graph = [[INF] * (n + 1) for _ in range(n + 1)]

for a in range(1, n + 1):
    for b in range(1, n + 1):
        if a == b:
            graph[a][b] = 0  # 자기 자신으로 가는 비용은 0으로 초기화

for _ in range(m):
    a, b, cost = map(int, input().split())
    graph[a][b] = cost

for k in range(1, n + 1):
    for a in range(1, n + 1):
        for b in range(1, n + 1):
            # a에서 b로 가는 비용과 a에서 k를 거쳐 b로 가는 비용을 비교
            graph[a][b] = min(graph[a][b], graph[a][k] + graph[k][b])

for a in range(1, n + 1):
    for b in range(1, n + 1):
        if graph[a][b] == INF:
            print("INF", end=" ")
        else:
            print(graph[a][b], end=" ")
    print()
```

### Input

```py
4
7
1 2 4
1 4 6
2 1 3
2 3 7
3 1 5
3 4 4
4 3 2
```

### Output

```py
0 4 8 6
3 0 7 9
5 9 0 4
7 11 2 0
```

## 실전 문제 1: 미래 도시

### Testcase 1

```py
5 7
1 2
1 3
1 4
2 4
3 4
3 5
4 5
4 5
# 3
```

### Testcase 2

```py
4 2
1 3
2 4
3 4
# -1
```

### Solution

- 플로이드 워셜 알고리즘을 그대로 적용하기만 하면 풀린다.

```py
INF = int(1e9)
n, m = map(int, input().split())

graph = [[INF] * (n + 1) for _ in range(n + 1)]

for a in range(1, n + 1):
    for b in range(1, n + 1):
        if a == b:
            graph[a][b] = 0

for _ in range(m):
    a, b = map(int, input().split())
    graph[a][b] = 1
    graph[b][a] = 1

x, k = map(int, input().split())

for s in range(1, n + 1):
    for a in range(1, n + 1):
        for b in range(1, n + 1):
            graph[a][b] = min(graph[a][b], graph[a][s] + graph[s][b])


answer = graph[1][k] + graph[k][x]
print(answer) if answer < INF else print(-1)

```

## 실전 문제 2: 전보

### Testcase

```py
3 2 1
1 2 4
1 3 2
# 2 4
```

### Solution

- 시작 노드는 도시의 개수에서 제외해야 한다.
- C라는 도시에서 다른 도시로 거쳐 마지막 도시까지 가는 것이 아니라 동시에 메시지를 보낼 수 있기 때문에 가장 멀리 있는 도시까지의 최단 거리를 구하면 된다.

```py
import heapq
import sys

input = sys.stdin.readline
INF = int(1e9)

n, m, c = map(int, input().split())
graph = [[] for i in range(n + 1)]

distances = [INF] * (n + 1)

for _ in range(m):
    a, b, cost = map(int, input().split())
    graph[a].append((b, cost))


def dijkstra(start):
    queue = []
    heapq.heappush(queue, (0, start))
    distances[start] = 0

    while queue:
        curr_distance, curr_node = heapq.heappop(queue)
        if distances[curr_node] < curr_distance:
            continue
        for i in graph[curr_node]:
            distance = curr_distance + i[1]
            if distance < distances[i[0]]:
                distances[i[0]] = distance
                heapq.heappush(queue, (distance, i[0]))


dijkstra(c)

count = 0
time = 0
for i in range(1, n + 1):
    if distances[i] == INF:
        continue
    else:
        count += 1
        time = max(time, distances[i])

print(count - 1, time)

# 참고
# count = 0
# max_distance = 0
# for d in distance:
#     if d != 1e9:
#         count += 1
#         max_distance = max(max_distance, d)
# print(count - 1, max_distance)

```
