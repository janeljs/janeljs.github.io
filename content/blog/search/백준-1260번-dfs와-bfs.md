---
title: 백준 1260번 DFS와 BFS
date: 2021-08-17 02:08:91
category: search
thumbnail: { thumbnailSrc }
draft: false
---

- https://www.acmicpc.net/problem/1260

## Solution

```py
import sys
from collections import deque

input = sys.stdin.readline

n, m, v = map(int, input().split())

graph = [[] for _ in range(n + 1)]
visited = [False] * (n + 1)

for _ in range(m):
    a, b = map(int, input().split())
    graph[a].append(b)
    graph[b].append(a)

for i in range(1, n + 1):
    graph[i].sort()


def dfs(start):
    visited[start] = True
    print(start, end=' ')
    for i in graph[start]:
        if not visited[i]:
            dfs(i)


def bfs(start):
    queue = deque([start])
    visited[start] = True

    while queue:
        now = queue.popleft()
        print(now, end=' ')
        for i in graph[now]:
            if not visited[i]:
                queue.append(i)
                visited[i] = True


dfs(v)
visited = [False] * (n + 1)
print()
bfs(v)
```

- [호석님 풀이](https://github.com/janeljs/FastCampus/tree/main/%EA%B0%95%EC%9D%98%20%EC%9E%90%EB%A3%8C/02-%EC%95%8C%EA%B3%A0%EB%A6%AC%EC%A6%98/09~11-%EA%B7%B8%EB%9E%98%ED%94%84%20%ED%83%90%EC%83%89/%EB%AC%B8%EC%A0%9C%EB%B3%84%20%EC%BD%94%EB%93%9C/1260-DFS%EC%99%80%20BFS)

```py
import sys
from collections import deque
si = sys.stdin.readline
n, m, V = list(map(int, si().split()))
adj = [[] for _ in range(n + 1)]

for _ in range(m):
    x, y = list(map(int, si().split()))
    adj[x].append(y)
    adj[y].append(x)

for i in range(1, n + 1):
    adj[i].sort()

visit = [0] * (n + 1)
def dfs(x):
    visit[x] = 1
    print(x, end=' ')
    for y in adj[x]:
        if visit[y]:
            continue
        dfs(y)

def bfs(x):
    visit = [0] * (n + 1)
    queue = deque()
    queue.append(x)
    visit[x] = 1
    while queue:
        x = queue.popleft()
        print(x, end=' ')
        for y in adj[x]:
            if visit[y]:
                continue
            visit[y] = 1
            queue.append(y)

dfs(V)
print()
bfs(V)
```
