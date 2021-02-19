---
title: 이코테 Chapter 10 그래프 이론 (1)
date: 2021-02-19 00:02:26
category: graph
thumbnail: { thumbnailSrc }
draft: false
---

## 서로소 집합(Disjoint Sets)

- 공통 원소가 없는 두 집합
- 서로소 집합 자료구조: 서로소 부분 집합들로 나누어진 원소들의 데이터를 처리하기 위한 자료구조
  &rarr; 합집합(union)과 찾기(find) 연산으로 조작하기 때문에 union-find 자료구조라고도 부른다.
  - union: 두 개별 집합을 하나의 집합으로 합치는 연산
  - find: 특정한 원소가 속한 집합이 어떠한 집합인지 알려주는 연산
- 무방향 그래프 내에서의 사이클을 판별할 때 사용할 수 있다.

## union-find 알고리즘

1. A와 B의 루트 노드를 찾는다.
2. A의 루트 노드를 B의 부모 노드로 설정한다.
3. 모든 union 연산을 처리할 때까지 1번과 2번을 반복한다.

### 구현

- 시간복잡도 : $O(VM)$

```py
def find_parent(parent, x):
    if parent[x] != x:
        return find_parent(parent, parent[x])
    return x


def union_parent(parent, a, b):
    a = find_parent(parent, a)
    b = find_parent(parent, b)
    if a < b:
        parent[b] = a
    else:
        parent[a] = b


v, e = map(int, input().split())
parent = [0] * (v + 1)

for i in range(1, v + 1):
    parent[i] = i

for i in range(e):
    a, b = map(int, input().split())
    union_parent(parent, a, b)

print('각 원소가 속한 집합: ', end='')
for i in range(1, v + 1):
    print(find_parent(parent, i), end=' ')

print()

print('부모 테이블: ', end='')
for i in range(1, v + 1):
    print(parent[i], end=' ')

```

### Input

```py
6 4
1 4
2 3
2 4
5 6
```

### Output

```py
각 원소가 속한 집합: 1 1 1 1 5 5 # root node
부모 테이블: 1 1 2 1 5 5
```

## path compression

- Find를 실행한 노드에서 거쳐간 노드를 root에 바로 연결하는 기법
- Find를 실행한 노드는 root node를 한 번에 알 수 있다.

```py
def find(node):
    # path compression 기법
    if parent[node] != node:
        parent[node] = find(parent[node])
    return parent[node]

```

## 사이클 판별 알고리즘

1. 각 간선을 확인하며 두 노드의 루트 노드를 확인한다.
   - 만약 루트 노드가 서로 다르다면 union 연산을 수행한다.
   - 루트노드가 서로 같다면 사이클이 발생한 것이다.
2. 모든 간선에 대하여 1번 과정을 반복한다.

※ 간선에 방향이 없는 그래프에서만 적용가능

```py
def find_parent(x):
    if parent[x] != x:
        parent[x] = find_parent(parent[x])
    return parent[x]


def union_parent(a, b):
    a = find_parent(a)
    b = find_parent(b)
    if a < b:
        parent[b] = a
    else:
        parent[a] = b


v, e = map(int, input().split())
parent = [0] * (v + 1)

for i in range(1, v + 1):
    parent[i] = i

cycle = False

for i in range(e):
    a, b = map(int, input().split())
    if find_parent(a) == find_parent(b):
        cycle = True
        break
    else:
        union_parent(a, b)

if cycle:
    print("cycle")
else:
    print("no cycle")

```

### Input

```py
3 3
1 2
1 3
2 3
```

### Output

```py
cycle
```

#

**_Source_**

- https://github.com/ndb796/python-for-coding-test
