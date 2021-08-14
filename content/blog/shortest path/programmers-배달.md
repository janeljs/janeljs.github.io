---
title: Programmers 배달
date: 2021-08-13 03:08:63
category: shortest path
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/12978

## Solution

- 다익스트라 알고리즘을 활용하여 풀 수 있다.
- 문제는 단방향이 아니라 양방향 그래프이고, 양방향인 주제에 가중치가 다른 길이 여러 개가 있을 수도 있다는 것.
- 따라서 두 정점을 잇는 길이 2개이고, 가중치가 서로 다르다면 최솟값만 고려해주어야 한다.

```py
import ast

inf = int(1e9)


def solution(N, road, K):
    global n
    n = N
    start = 1
    graph = [[] for i in range(n + 1)]
    visited = [False] * (n + 1)
    distance = [inf] * (n + 1)

    temp = [(sorted([a, b]), c) for a, b, c in road]
    dic = dict()
    for i in range(len(temp)):
        key = str(temp[i][0])
        if key in dic:
            dic[key] = min(dic[key], temp[i][1])
        else:
            dic[key] = temp[i][1]
    result = []
    for key, value in dic.items():
        key = ast.literal_eval(key)
        result.append(key + [value])

    road = result
    for i in range(len(road)):
        a, b, c = road[i]
        graph[a].append((b, c))
        graph[b].append((a, c))

    distance = dijkstra(graph, distance, start, visited)

    return len([d for d in distance if d <= K])


def get_smallest_node(distance, visited):
    min_value = inf
    node_number = 0
    for i in range(1, n + 1):
        if distance[i] < min_value and not visited[i]:
            min_value = distance[i]
            node_number = i
    return node_number


def dijkstra(graph, distance, start, visited):
    distance[start] = 0
    visited[start] = True
    for i in graph[start]:
        distance[i[0]] = i[1]

    for _ in range(n - 1):
        now = get_smallest_node(distance, visited)
        visited[now] = True
        for j in graph[now]:
            cost = distance[now] + j[1]
            if cost < distance[j[0]]:
                distance[j[0]] = cost
    return distance
```

- 개선된 다익스트라 알고리즘을 이용한 풀이

```py
import heapq


def dijkstra(distance, graph, start):
    q = []
    distance[start] = 0
    heapq.heappush(q, (0, start))

    while q:
        dist, now = heapq.heappop(q)
        if distance[now] < dist:
            continue
        for i in graph[now]:
            cost = dist + i[1]
            if cost < distance[i[0]]:
                distance[i[0]] = cost
                heapq.heappush(q, (cost, i[0]))
    return distance


def solution(N, road, K):
    INF = int(1e9)
    graph = [[] for _ in range(N + 1)]
    distance = [INF] * (N + 1)

    for r in road:
        a, b, c = r
        graph[a].append((b, c))
        graph[b].append((a, c))

    distance = dijkstra(distance, graph, 1)

    return len([d for d in distance if d <= K])
```
