---
title: 이코테 Chapter 6 정렬 알고리즘 (2)
date: 2021-02-03 13:02:81
category: sorting
thumbnail: { thumbnailSrc }
draft: false
---

### 📌 정렬 알고리즘 이론

> [이코테 Chapter 6 정렬 알고리즘 (1)](https://janeljs.github.io/sorting/sorting-basic-1/)

## 실전 문제 1: 위에서 아래로

## Testcase

```py
3
15
27
12
# 27 15 12
```

### Solution

```py
n = int(input())
_list = [int(input()) for _ in range(n)]

_list.sort(reverse=True)

for x in _list:
    print(x, end=" ")
```

## 실전 문제 2: 성적이 낮은 순서로 학생 출력하기

### Testcase

```py
2
홍길동 95
이순신 77
# 이순신 홍길동
```

### Solution

```py
n = int(input())
_list = []
for x in range(n):
    n, m = input().split()
    _list.append((n, int(m)))

_list.sort(key=lambda x: x[1])

for x in _list:
    print(x[0], end=" ")
```

## 실전 문제 3: 두 배열의 원소 교체

### Testcase

```py
5 3
1 2 5 4 3
5 5 6 6 5
# 26
```

### Solution

```py
n, k = map(int, input().split())
a = list(map(int, input().split()))
a.sort()
b = list(map(int, input().split()))
b.sort(reverse=True)

for i in range(k):
    if a[i] < b[i]:
        a[i], b[i] = b[i], a[i]
    else:
        break

print(sum(a))

```

#

**_Source_**

- https://github.com/ndb796/python-for-coding-test
