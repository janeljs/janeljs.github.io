---
title: 이코테 Chapter 5 DFS/BFS
date: 2021-01-25 05:01:14
category: search
thumbnail: { thumbnailSrc }
draft: false
---

## 탐색

- 많은 양의 데이터 중에서 원하는 데이터를 찾는 과정

## 자료구조 관련 Tip

- Stack과 Queue를 사용할 때는 overflow와 underflow에 주의해야 한다.
- Stack은 기본 리스트의 append()와 pop()메서드를 사용하면 되지만, Queue는 기본 리스트에 비해 데이터의 삽입과 삭제가 효율적인 deque 라이브러리를 사용하는 것이 좋다.

```py

# 큐(Queue) 구현을 위해 deque 라이브러리 사용
queue = deque()

# 삽입(5) - 삽입(2) - 삽입(3) - 삽입(7) - 삭제() - 삽입(1) - 삽입(4) - 삭제()
queue.append(5)
queue.append(2)
queue.append(3)
queue.append(7)
queue.popleft()
queue.append(1)
queue.append(4)
queue.popleft()

print(queue) # 먼저 들어온 순서대로 출력
queue.reverse() # 다음 출력을 위해 역순으로 바꾸기
print(queue) # 나중에 들어온 원소부터 출력
```

## 재귀 함수

- 스택 자료구조를 활용해야 하는 알고리즘은 재귀 함수를 통해 구현할 수 있는 경우가 많다. (e.g. DFS)
- 반복문 대신 재귀함수를 이용하면 코드가 간결해지는데 이는 수학적 점화식을 그대로 반영했기 때문이다.
  - 점화식: 특정한 함수를 자신보다 더 작은 변수에 대한 함수와의 관계로 표현한 것

## DFS (Depth-First Search)

- 깊이 우선 탐색, 그래프에서 깊은 부분을 우선적으로 탐색하는 알고리즘

### 그래프

- 인접 행렬(Adjacency Matrix) 방식
  - 2차원 배열에 각 노드가 연결된 형태롤 기록

#

**_Source_**

- https://github.com/ndb796/python-for-coding-test
