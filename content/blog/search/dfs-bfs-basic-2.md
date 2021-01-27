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

#

**_Source_**

- https://github.com/ndb796/python-for-coding-test
- https://www.fun-coding.org/Chapter18-dfs-live.html
