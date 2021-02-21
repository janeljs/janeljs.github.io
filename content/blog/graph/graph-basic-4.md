---
title: 이코테 Chapter 10 그래프 실전 문제 (1)
date: 2021-02-20 04:02:46
category: graph
thumbnail: { thumbnailSrc }
draft: false
---

## 실전 문제 1: 팀 결성

## Testcase

```py
7 8
0 1 3
1 1 7
0 7 6
1 7 1
0 3 7
0 4 2
0 1 1
1 1 1
# NO
# NO
# YES
```

## Solution

- 문제 설명부터 union-find 알고리즘 냄새가 풀풀 난다.

```py
# 내 풀이

def find_parent(parent, x):
    if parent[x] != x:
        find_parent(parent, parent[x])
    return parent[x]


def union_parent(parent, a, b):
    a = find_parent(parent, a)
    b = find_parent(parent, b)
    if a < b:
        parent[b] = a
    else:
        parent[a] = b


n, m = map(int, input().split())
parent = [0] * (n + 1)

for i in range(1, n + 1):
    parent[i] = i

answer = []

for i in range(m):
    a, b, c = map(int, input().split())
    if (a != 1):
        union_parent(parent, b, c)
    else:
        answer.append((b, c))

for x in answer:
    if find_parent(parent, x[0]) == find_parent(parent, x[1]):
        print("YES")
    else:
        print("NO")
```

- 모범 풀이는 아래와 같다.

```py
# 특정 원소가 속한 집합을 찾기
def find_parent(parent, x):
    # 루트 노드가 아니라면, 루트 노드를 찾을 때까지 재귀적으로 호출
    if parent[x] != x:
        parent[x] = find_parent(parent, parent[x])
    return parent[x]

# 두 원소가 속한 집합을 합치기
def union_parent(parent, a, b):
    a = find_parent(parent, a)
    b = find_parent(parent, b)
    if a < b:
        parent[b] = a
    else:
        parent[a] = b

n, m = map(int, input().split())
parent = [0] * (n + 1) # 부모 테이블 초기화

# 부모 테이블상에서, 부모를 자기 자신으로 초기화
for i in range(0, n + 1):
    parent[i] = i

# 각 연산을 하나씩 확인
for i in range(m):
    oper, a, b = map(int, input().split())
    # 합치합(Union) 연산인 경우
    if oper == 0:
        union_parent(parent, a, b)
    # 찾기(Find) 연산인 경우
    elif oper == 1:
        if find_parent(parent, a) == find_parent(parent, b):
            print('YES')
        else:
            print('NO')
```

#

**_Source_**

- https://github.com/ndb796/python-for-coding-test
