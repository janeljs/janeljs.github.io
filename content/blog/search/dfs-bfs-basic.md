---
title: 이코테 Chapter 5 DFS/BFS (1)
date: 2021-01-25 05:01:14
category: search
thumbnail: { thumbnailSrc }
draft: false
---

## 탐색

- 많은 양의 데이터 중에서 원하는 데이터를 찾는 과정

## 재귀 함수

- 스택 자료구조를 활용해야 하는 알고리즘은 재귀 함수를 통해 구현할 수 있는 경우가 많다. (e.g. DFS)
- 반복문 대신 재귀함수를 이용하면 코드가 간결해지는데 이는 수학적 점화식을 그대로 반영했기 때문이다.
  - 점화식: 특정한 함수를 자신보다 더 작은 변수에 대한 함수와의 관계로 표현한 것

## 스택 & 큐

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

## 그래프

### 인접 행렬(Adjacency Matrix)

- 2차원 배열에 각 노드가 연결된 형태롤 기록
- 모든 관계를 저장하므로 노드 개수가 많을 수록 메모리가 낭비가 많아진다.

```py
INF = 999999999 # 무한의 비용 선언

# 2차원 리스트를 이용해 인접 행렬 표현
graph = [
    [0, 7, 5],
    [7, 0, INF],
    [5, INF, 0]
]

print(graph)
```

### 인접 리스트(Adjacency List)

- 리스트로 그래프의 연결 관계를 표현
- 연결된 정보만을 저장하기 때문에 인접 행렬에 비해 메모리를 효율적으로 사용하지만, 특정한 두 노드가 연결되어있는지 확인하는 속도가 느리다.

```py
# 행(Row)이 3개인 2차원 리스트로 인접 리스트 표현
graph = [[] for _ in range(3)]

# 노드 0에 연결된 노드 정보 저장 (노드, 거리)
graph[0].append((1, 7))
graph[0].append((2, 5))

# 노드 1에 연결된 노드 정보 저장 (노드, 거리)
graph[1].append((0, 7))

# 노드 2에 연결된 노드 정보 저장 (노드, 거리)
graph[2].append((0, 5))

print(graph)
```

- 슬프게도 자바 코드는 길다.
- 노드 객체가 들어있는 ArrayList가 들어있는 ArrayList를 만들고, 파이썬과 동일한 방식으로 정보를 저장하면 된다.

```java
import java.util.*;

class Node {

    private int index;
    private int distance;

    public Node(int index, int distance) {
        this.index = index;
        this.distance = distance;
    }

    public void show() {
        System.out.print("(" + this.index + "," + this.distance + ") ");
    }
}

public class Main {

    // 행(Row)이 3개인 인접 리스트 표현
    public static ArrayList<ArrayList<Node>> graph = new ArrayList<ArrayList<Node>>();

    public static void main(String[] args) {
        // 그래프 초기화
        for (int i = 0; i < 3; i++) {
            graph.add(new ArrayList<Node>());
        }

        // 노드 0에 연결된 노드 정보 저장 (노드, 거리)
        graph.get(0).add(new Node(1, 7));
        graph.get(0).add(new Node(2, 5));

        // 노드 1에 연결된 노드 정보 저장 (노드, 거리)
        graph.get(1).add(new Node(0, 7));

        // 노드 2에 연결된 노드 정보 저장 (노드, 거리)
        graph.get(2).add(new Node(0, 5));

        // 그래프 출력
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < graph.get(i).size(); j++) {
                graph.get(i).get(j).show();
            }
            System.out.println();
        }
    }

}
```

- show() 메서드를 만드는 대신 toString을 override하는 형태로 바꿔주고, index와 distance는 final로 선언해주었다.

```java
import java.util.*;

class Node {
    private final int index;
    private final int distance;

    public Node(int index, int distance) {
        this.index = index;
        this.distance = distance;
    }

    @Override
    public String toString() {
        return "(" + index + "," + distance + ") ";
    }
}

class Main {

    public static ArrayList<ArrayList<Node>> graph = new ArrayList<ArrayList<Node>>();

    public static void main(String[] args) {

        for (int i = 0; i < 3; i++) {
            graph.add(new ArrayList<Node>());
        }

        graph.get(0).add(new Node(1, 7));
        graph.get(0).add(new Node(2, 5));
        graph.get(1).add(new Node(0, 7));
        graph.get(2).add(new Node(0, 5));

        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < graph.get(i).size(); j++) {
                System.out.print(graph.get(i).get(j));
            }
            System.out.println();
        }
    }
}
```

#

**_Source_**

- https://github.com/ndb796/python-for-coding-test
