---
title: 이코테 Chapter 7 이진 탐색
date: 2021-02-06 21:02:21
category: search
thumbnail: { thumbnailSrc }
draft: false
---

## 이진 탐색

- 시작점, 끝점, 중간점을 설정한 뒤 찾으려는 데이터와 중간점 위치에 있는 데이터를 반복적으로 비교하여 원하는 데이터를 찾는 알고리즘
- 데이터가 이미 정렬되어 있다면 매우 빠르게 데이터를 찾을 수 있다.

```py
def binary_search(array, target, start, end):
    if start > end:
        return None
    mid = (start + end) // 2
    # 찾은 경우 중간점 인덱스 반환
    if array[mid] == target:
        return mid
    # 중간점의 값보다 찾고자 하는 값이 작은 경우 왼쪽 확인
    elif array[mid] > target:
        return binary_search(array, target, start, mid - 1)
    # 중간점의 값보다 찾고자 하는 값이 큰 경우 오른쪽 확인
    else:
        return binary_search(array, target, mid + 1, end)
```

## 실전 문제 1: 부품 찾기

## Testcase 1

```py
5
8 3 7 9 2
3
5 7 9
# no yes yes
```

## Testcase 2

```py
10
1 8 6 98 7 5 6 7 8 7
5
1 2 3 98 7
# yes no no yes yes
```

### Solution

- 이진 탐색을 이용하면 쉽게 풀 수 있다.

```py
# 내 풀이

n = int(input())
data = list(map(int, input().split()))
m = int(input())
target = list(map(int, input().split()))

data.sort()


def binary_search(data, target, start, end):
    if start > end:
        print("no", end=" ")
        return None
    mid = (start + end) // 2
    if data[mid] == target:
        print("yes", end=" ")
        return mid
    elif target < data[mid]:
        binary_search(data, target, start, mid - 1)
    elif target > data[mid]:
        binary_search(data, target, mid + 1, end)


for x in target:
    binary_search(data, x, 0, n - 1)
```

- 모범 풀이를 보니 계수 정렬 또는 set()을 이용해서도 문제를 해결할 수 있었다.
- 계수 정렬 풀이

```py
n = int(input())
array = [0] * 1000001

# 가게에 있는 전체 부품 번호를 입력 받아서 기록
for i in input().split():
    array[int(i)] = 1

m = int(input())
x = list(map(int, input().split()))

# 손님이 확인 요청한 부품 번호를 하나씩 확인
for i in x:
    # 해당 부품이 존재하는지 확인
    if array[i] == 1:
        print('yes', end=' ')
    else:
        print('no', end=' ')
```

- set() 함수를 이용한 풀이

```py
n = int(input())
array = set(map(int, input().split()))

m = int(input())
x = list(map(int, input().split()))

for i in x:
    if i in array:
        print('yes', end=' ')
    else:
        print('no', end=' ')
```

## 실전 문제 2: 떡볶이 떡 만들기

## Testcase 1

```py
4 6
19 15 10 17
# 15
```

## Testcase 2

```py
5 10
24 27 18 29 15
# 23
```

## Testcase 3

```py
7 19
23 20 18 27 15 31 17
# 20
```

### Solution

```py
# 내 풀이

n, m = map(int, input().split())
data = list(map(int, input().split()))

data.sort()

def binary_search(data, n, m, start, end):
    mid = (start + end) // 2
    if start > end:
        return None
    total = 0
    for x in data:
        if x > data[mid]:
            total += x - data[mid]
    if total >= m:
        binary_search(data, n, m, mid + 1, end)
    elif total < m:
        binary_search(data, n, m, start, mid - 1)
    return data[mid]

answer = binary_search(data, n, m, 0, len(data) - 1)

while (True):
    total = 0
    for x in data:
        if x > answer:
            total += x - answer
    if total >= m:
        break
    answer -= 1

print(answer)
```

- 이 문제는 Parametric Search 유형의 문제이며, Parametric Search는 '원하는 조건을 만족하는 가장 알맞은 값을 찾는 문제'에서 사용한다고 한다.
- 나는 모르고 재귀적으로 구현했지만, 일반적으로 Parametric Search 유형은 반복문으로 구현하는 것이 더 간단하다고 한다.
- 주어진 데이터의 리스트를 그대로 탐색할 필요 없이, 시작점을 0, 끝점을 가장 긴 떡의 길이로 설정하면 문제를 쉽게 해결할 수 있다.

```py
# 떡의 개수(N)와 요청한 떡의 길이(M)을 입력
n, m = list(map(int, input().split(' ')))
# 각 떡의 개별 높이 정보를 입력
array = list(map(int, input().split()))

# 이진 탐색을 위한 시작점과 끝점 설정
start = 0
end = max(array)

# 이진 탐색 수행 (반복적)
result = 0
while(start <= end):
    total = 0
    mid = (start + end) // 2
    for x in array:
        # 잘랐을 때의 떡볶이 양 계산
        if x > mid:
            total += x - mid
    # 떡볶이 양이 부족한 경우 더 많이 자르기 (오른쪽 부분 탐색)
    if total < m:
        end = mid - 1
    # 떡볶이 양이 충분한 경우 덜 자르기 (왼쪽 부분 탐색)
    else:
        result = mid # 최대한 덜 잘랐을 때가 정답이므로, 여기에서 result에 기록
        start = mid + 1

# 정답 출력
print(result)
```

#

**_Source_**

- https://github.com/ndb796/python-for-coding-test
