---
title: 이코테 Chapter 10 그래프 이론 (2)
date: 2021-02-19 00:02:92
category: graph
thumbnail: { thumbnailSrc }
draft: false
---

## 신장 트리(Spanning Tree)

- 하나의 그래프가 있을 때 모든 노드를 포함하면서 사이클이 존재하지 않는 부분 그래프  
  &rarr; 본래의 그래프의 모든 노드를 포함하면서  
  &rarr; 모든 노드가 서로 연결되어 있고  
  &rarr; 사이클이 존재하지 않아야 한다 (트리의 속성)
- 트리 자료구조이므로 노드가 N개일 때 간선의 개수는 N-1개이다.

## 크루스칼 알고리즘

- 최소 신장 트리 알고리즘 (신장 트리 중에서 최소 비용으로 만들 수 있는 신장 트리를 찾는 알고리즘)
- 그리디 알고리즘

### 동작 과정

1. 간선 데이터를 비용에 따라 오름차순으로 정렬한다.
2. 간선을 하나씩 확인하며 현재의 간선이 사이클을 발생시키는지 확인한다.
   - 사이클이 발생하지 않는 경우 최소 신장 트리에 포함시킨다.
   - 사이클이 발생하는 경우(루트가 이미 동일한 집합에 포함되어 있는 경우) 최소 신장 트리에 포함시키지 않는다.
3. 모든 간선에 대하여 2번의 과정을 반복한다.

### 구현

```py
def find_parent(parent, x):
    if parent[x] != x:
        parent[x] = find_parent(parent, parent[x])
    return parent[x]


def union_parent(parent, a, b):
    a = find_parent(parent, a)
    b = find_parent(parent, b)
    if a < b:
        parent[b] = a
    else:
        parent[a] = b


v, e = map(int, input().split())
parent = [0] * (v + 1)

edges = []  # 모든 간선을 담을 리스트
result = 0  # 최종 비용

for i in range(1, v + 1):
    parent[i] = i

for _ in range(e):
    a, b, cost = map(int, input().split())
    edges.append((cost, a, b))

edges.sort()

for edge in edges:
    cost, a, b = edge
    if find_parent(parent, a) != find_parent(parent, b):
        union_parent(parent, a, b)
        result += cost

print(result)

```

### Input

```py
7 9
1 2 29
1 5 75
2 3 35
2 6 34
3 4 7
4 6 23
4 7 13
5 6 53
6 7 25
```

### Output

```py
159
```
