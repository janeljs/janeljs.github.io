---
title: 이코테 Chapter 5 DFS/BFS (4)
date: 2021-01-30 11:01:65
category: search
thumbnail: { thumbnailSrc }
draft: false
---

### 📌 DFS/BFS 개념 및 기초 예제

> [이코테 Chapter 5 DFS/BFS (1)](https://janeljs.github.io/search/dfs-bfs-basic/)  
> [이코테 Chapter 5 DFS/BFS (2)](https://janeljs.github.io/search/dfs-bfs-basic-2/)  
> [이코테 Chapter 5 DFS/BFS (3)](https://janeljs.github.io/search/dfs-bfs-basic-3/)

## 실전 문제 1: 음료수 얼려 먹기

## Testcase 1

```py
4 5
00110
00011
11111
00000
# 3
```

## Testcase 2

```py
15 14
00000111100000
11111101111110
11011101101110
11011101100000
11011111111111
11011111111100
11000000011111
01111111111111
00000000011111
01111111111000
00011111111000
00000001111000
11111111110011
11100011111111
11100011111111
# 8
```

### Solution

- input값 사이에 띄어쓰기가 없다는 점을 주의하자.  
  습관적으로 input().split() 쓰지 말고 문제 입력값 확인해야겠다.
- DFS = 재귀로 구현!

```py
n, m = map(int, input().split())
graph = [list(map(int, input())) for _ in range(n)]

def dfs(x, y):
    if x < 0 or y < 0 or x >= n or y >= m:
        return False
    if graph[x][y] == 0:
        graph[x][y] = 1
        dfs(x, y + 1)
        dfs(x + 1, y)
        dfs(x - 1, y)
        dfs(x, y - 1)
        return True
    return False

answer = 0
for i in range(n):
    for j in range(m):
        if dfs(i, j) == True:
            answer += 1
print(answer)

```

## 실전 문제 2: 미로 탈출

### Testcase

```py
5 6
101010
111111
000001
111111
111111
```

### Solution

- 구현 알고리즘의 [상하좌우](https://janeljs.github.io/Implementation/implementation-basic/) 문제랑 약간 비슷하다.
- BFS = deque 이용! (사실 기본 리스트로도 풀 수 있는데, 교재에서 deque을 권장하니 다음에는 deque을 이용해보도록 하자)

```py
n, m = map(int, input().split())
graph = [list(map(int, input())) for _ in range(n)]

dx = [-1, 0, 1, 0]
dy = [0, 1, 0, -1]

def bfs(x, y):
    queue = [(x, y)]
    while queue:
        x, y = queue.pop(0)
        for i in range(4):
            nx = x + dx[i]
            ny = y + dx[i]
            if nx < 0 or ny < 0 or nx >= n or ny >= m:
                continue
            if graph[nx][ny] == 0:
                continue
            elif graph[nx][ny] == 1:
                graph[nx][ny] = graph[x][y] + 1
                queue.append((x, y))
    return graph[n - 1][m - 1]

print(bfs(0, 0))
```

## Feedback

- 아직 실력이 부족해서 그런지 오래 고민해도 구현이나 그리디 알고리즘이 아닌 경우 풀이가 잘 떠오르지 않는다.
- 알고리즘을 유형별로 풀기 전에는 어떻게든 그냥 풀었던 것 같은데, DFS로 풀어야 돼! DP로 풀어야 돼!라는 생각이 있으니 더 못 푸는 것 같기도...
- PART 02까지는 유형을 익힌다는 느낌으로 공부하고, PART 03부터는 고민하는 시간을 늘려보자

#

**_Source_**

- https://github.com/ndb796/python-for-coding-test
- https://www.fun-coding.org/Chapter20-shortest-live.html
