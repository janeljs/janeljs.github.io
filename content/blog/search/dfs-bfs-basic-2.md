---
title: 이코테 Chapter 5 DFS/BFS (2)
date: 2021-01-27 17:01:70
category: search
thumbnail: { thumbnailSrc }
draft: false
---

# DFS (Depth-First Search)

- 깊이 우선 탐색, 그래프에서 깊은 부분을 우선적으로 탐색하는 알고리즘
  (= 정점의 자식들을 먼저 탐색하는 방식)
- 스택 자료구조에 기초한다.
- 데이터 탐색에 $O(N)$의 시간이 소요된다.

## 동작 과정

1. 탐색을 시작한 노드를 스택에 삽입하고 방문 체크를 한다.
2. 스택의 최상단 노드에 방문하지 않은 인접 노드가 있다면, 그 노드를 스택에 넣고 방문 체크를 한다.
   ※ 방문하지 않은 노드가 여러 개 있다면 (일반적으로) 번호가 낮은 순서부터 처리한다.
   ※ 방문하지 않은 인접 노드가 없다면, 스택에서 최상단 노드를 꺼낸다.
3. 2번의 과정을 더 이상 수행할 수 없을 때까지 반복한다.

## 구현

- 재귀함수를 이용하면 간결하게 구현할 수 있다.

```py
# DFS 함수 정의
def dfs(graph, v, visited):
    # 현재 노드를 방문 처리
    visited[v] = True
    print(v, end=' ')
    # 현재 노드와 연결된 다른 노드를 재귀적으로 방문
    for i in graph[v]:
        if not visited[i]:
            dfs(graph, i, visited)

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

# 정의된 DFS 함수 호출
dfs(graph, 1, visited)
```

- 자바 코드는 아래와 같다.
  (Enhanced for 문을 사용해서 교재 코드를 조금 더 간단하게 고쳐보았다.)
- 자바의 경우 graph와 visited를 static으로 선언해주면 굳이 메서드의 인자로 받지 않아도 된다.
  (파이썬도 마찬가지지만, global 키워드 사용을 피하려고 매개변수로 받은 것 같다.)
- 또한 처음부터 boolean으로 타입을 지정하여 배열을 생성하기 때문에 false로 초기화 되어있다.

```java
import java.util.*;
class Main {
    public static boolean[] visited = new boolean[9];
    public static ArrayList<ArrayList<Integer>> graph = new ArrayList<ArrayList<Integer>>();

    public static void dfs(int x) {
        visited[x] = true;
        System.out.print(x + " ");
        for (int i :graph.get(x)) {
            if (!visited[i]) dfs(i);
        }
    }

    public static void main(String[] args) {
        for (int i = 0; i < 9; i++) {
            graph.add(new ArrayList<Integer>());
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

        dfs(1);
    }

}
```

#

**_Source_**

- https://github.com/ndb796/python-for-coding-test
- https://www.fun-coding.org/Chapter18-dfs-live.html
