---
title: 이코테 Chapter 5 DFS/BFS (3)
date: 2021-01-27 18:01:82
category: search
thumbnail: { thumbnailSrc }
draft: false
---

# BFS (Breath-First Search)

- 너비 우선 탐색, 가까운 노드부터 탐색하는 알고리즘
- 큐를 이용하여 구현 (파이썬의 경우 deque 라이브러리 이용)
- 탐색에는 $O(N)$이 소요되며, 일반적으로 코딩테스트에서는 DFS보다 빠르다.
- 1차원 배열이나 2차원 배열도 그래프 형태로 바꾸어 생각할 수 있다.  
  예를 들어 2차원 배열을 탐색하는 문제에서 각 좌표를 상하좌우로만 이동할 수 있다면 해당 배열의 각 원소를 간선으로 연결된 노드라고 생각할 수 있다.

## 동작 과정

1. 탐색 시작 노드를 큐에 삽입하고 방문 체크를 한다.
2. 큐에서 노드를 꺼내 해당 노드의 인접 노드 중에서 방문하지 않은 노드를 모두 큐에 삽입하고 방문 체크를 한다.
3. 2번의 과정을 더 이상 수행할 수 없을 때까지 반복한다.

## 구현

- 아래는 교재에 나와있는 파이썬 코드이다.

```py
from collections import deque

# BFS 함수 정의
def bfs(graph, start, visited):
    # 큐(Queue) 구현을 위해 deque 라이브러리 사용
    queue = deque([start])
    # 현재 노드를 방문 처리
    visited[start] = True
    # 큐가 빌 때까지 반복
    while queue:
        # 큐에서 하나의 원소를 뽑아 출력
        v = queue.popleft()
        print(v, end=' ')
        # 해당 원소와 연결된, 아직 방문하지 않은 원소들을 큐에 삽입
        for i in graph[v]:
            if not visited[i]:
                queue.append(i)
                visited[i] = True

# 각 노드가 연결된 정보를 리스트 자료형으로 표현(2차원 리스트)
graph = [
  [],
  [2, 3, 8],
  [1, 7],
  [1, 4, 5],
  [3, 5],
  [3, 4],
  [7],
  [2, 6, 8],
  [1, 7]
]

# 각 노드가 방문된 정보를 리스트 자료형으로 표현(1차원 리스트)
visited = [False] * 9

# 정의된 BFS 함수 호출
bfs(graph, 1, visited)
```

- 파이썬 코드를 자바로 고쳐 다시 짜보았다.
- 코드를 다른 언어로 바꿔 다시 짜보면 더 기억에 잘 남는 것 같다.

```java
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Queue;

class Main {
    public static void main(String[] args) {
        BFS bfs = new BFS();
        bfs.initializeGraph();
        bfs.bfs(1);
    }
}

class BFS {
    private ArrayList<ArrayList<Integer>> graph = new ArrayList<>();
    private boolean[] visited = new boolean[9];

    public void initializeGraph() {
        for (int i = 0; i < 9; i++) {
            graph.add(new ArrayList<>());
        }
        graph.get(1).add(2);
        graph.get(1).add(3);
        graph.get(1).add(8);
        graph.get(2).add(1);
        graph.get(2).add(7);
        graph.get(3).add(1);
        graph.get(3).add(4);
        graph.get(3).add(5);
        graph.get(4).add(3);
        graph.get(4).add(5);
        graph.get(5).add(3);
        graph.get(5).add(4);
        graph.get(6).add(7);
        graph.get(7).add(2);
        graph.get(7).add(6);
        graph.get(7).add(8);
        graph.get(8).add(1);
        graph.get(8).add(7);
    }

    public void bfs(int start) {
        Queue<Integer> queue = new LinkedList<>();
        queue.offer(start);
        visited[start] = true;
        while (!queue.isEmpty()) {
            int v = queue.poll();
            System.out.print(v + " ");
            for (int i : graph.get(v)) {
                if (!visited[i]) {
                    queue.offer(i);
                    visited[i] = true;
                }
            }
        }
    }
}
```

## 참고

- 2차원 리스트가 아닌 dictionary 자료구조를 이용해도 그래프를 표현할 수 있다.

```py
graph = dict()

graph['A'] = ['B', 'C']
graph['B'] = ['A', 'D']
graph['C'] = ['A', 'G', 'H', 'I']
graph['D'] = ['B', 'E', 'F']
graph['E'] = ['D']
graph['F'] = ['D']
graph['G'] = ['C']
graph['H'] = ['C']
graph['I'] = ['C', 'J']
graph['J'] = ['I']
```

- 위의 graph를 이용하면 아래와 같이 BFS를 수행할 수 있으며 $O(V+E)$의 시간복잡도를 갖는다.
- count 변수를 추가하면 더 쉽게 이해할 수 있다.

```py
def bfs(graph, start):
    visited, need_visit = list(), list()

    need_visit.append(start)
    count = 0
    while need_visit:
        count += 1
        node = need_visit.pop(0)
        if node not in visited:
            visited.append(node)
            need_visit.extend(graph[node])
    print(count)
    return visited

print(bfs(graph, 'A'))

# 19
# ['A', 'B', 'C', 'D', 'G', 'H', 'I', 'E', 'F', 'J']
```

#

**_Source_**

- https://github.com/ndb796/python-for-coding-test
- https://www.fun-coding.org/Chapter18-bfs-live.html
