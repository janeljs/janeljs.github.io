---
title: 이코테 Chapter 6 정렬 알고리즘 (1)
date: 2021-01-31 07:01:86
category: sorting
thumbnail: { thumbnailSrc }
draft: false
---

## 정렬 알고리즘

- 데이터를 특정한 기준에 따라 순서대로 나열하는 알고리즘

## 선택정렬

- 주어진 데이터 중 최소값을 찾아 데이터 맨 앞에 위치한 값과 바꾸고, 맨 앞의 데이터를 뺀 나머지 데이터에 대해 동일한 방법으로 교체를 반복하여 데이터를 정렬하는 방법
- 가장 작은 값을 **`선택`**한다는 의미에서 선택 정렬 알고리즘이라고 부른다.
- 시간 복잡도 : $O(N^2)$

```py
array = [7, 5, 9, 0, 3, 1, 6, 2, 4, 8]

for i in range(len(array)):
    min_index = i # 가장 작은 원소의 인덱스
    for j in range(i + 1, len(array)):
        if array[min_index] > array[j]:
            min_index = j
    array[i], array[min_index] = array[min_index], array[i] # 스와프

print(array)
```

## 삽입 정렬

- 특정한 데이터를 적절한 위치에 삽입하여 정렬하는 방법
- 삽입 위치 앞의 데이터는 이미 정렬되어 있다고 가정한다.
- $O(N^2)$의 시간 복잡도를 갖지만, 데이터가 정렬되어 있을 경우 매우 빠르게 동작하며 최선의 경우 $O(N)$의 시간 복잡도를 가진다.

```py
array = [7, 5, 9, 0, 3, 1, 6, 2, 4, 8]

for i in range(1, len(array)):
    for j in range(i, 0, -1): # 인덱스 i부터 1까지 1씩 감소하며 반복하는 문법
        if array[j] < array[j - 1]: # 한 칸씩 왼쪽으로 이동
            array[j], array[j - 1] = array[j - 1], array[j]
        else: # 자기보다 작은 데이터를 만나면 그 위치에서 멈춤
            break

print(array)
```

## 퀵 정렬

- 피봇을 설정하고 피봇보다 큰 데이터와 작은 데이터의 위치를 교환하여 정렬하는 방법
- 평균적인 시간 복잡도: $O(NlogN)$
  - 단, 최악의 경우 O(N^2)의 시간복잡도를 갖는다.  
    (e.g. 데이터가 정렬되어 있는 경우)

```py
array = [5, 7, 9, 0, 3, 1, 6, 2, 4, 8]

def quick_sort(array, start, end):
    if start >= end: # 원소가 1개인 경우 종료
        return
    pivot = start # 피벗은 첫 번째 원소
    left = start + 1
    right = end
    while(left <= right):
        # 피벗보다 큰 데이터를 찾을 때까지 반복
        while(left <= end and array[left] <= array[pivot]):
            left += 1
        # 피벗보다 작은 데이터를 찾을 때까지 반복
        while(right > start and array[right] >= array[pivot]):
            right -= 1
        if(left > right): # 엇갈렸다면 작은 데이터와 피벗을 교체
            array[right], array[pivot] = array[pivot], array[right]
        else: # 엇갈리지 않았다면 작은 데이터와 큰 데이터를 교체
            array[left], array[right] = array[right], array[left]
    # 분할 이후 왼쪽 부분과 오른쪽 부분에서 각각 정렬 수행
    quick_sort(array, start, right - 1)
    quick_sort(array, right + 1, end)

quick_sort(array, 0, len(array) - 1)
print(array)
```

- 파이썬의 경우 아래와 같이 간결하게 코드를 작성할 수도 있다.

```py
array = [5, 7, 9, 0, 3, 1, 6, 2, 4, 8]

def quick_sort(array):
    if len(array) <= 1:
        return array
    pivot = array[0]
    tail = array[1:]
    left_side = [x for x in tail if x <= pivot]
    right_side = [x for x in tail if x > pivot]

    return quick_sort(left_side) + [pivot] + quick_sort(right_side)

print(quick_sort(array))
```

## 계수 정렬

- 데이터의 크기 범위가 제한되어 정수 형태로 표현할 수 있을 때만 사용 가능
  - 모든 범위를 담을 수 있는 크기의 배열을 선언해야 하기 때문
- 시간 복잡도 : $O(N+K)$

```py
# 모든 원소의 값이 0보다 크거나 같다고 가정
array = [7, 5, 9, 0, 3, 1, 6, 2, 9, 1, 4, 8, 0, 5, 2]
# 모든 범위를 포함하는 리스트 선언 (모든 값은 0으로 초기화)
count = [0] * (max(array) + 1)

for i in range(len(array)):
    count[array[i]] += 1 # 각 데이터에 해당하는 인덱스의 값 증가

for i in range(len(count)): # 리스트에 기록된 정렬 정보 확인
    for j in range(count[i]):
        print(i, end=' ') # 띄어쓰기를 구분으로 등장한 횟수만큼 인덱스 출력
```

## 파이썬의 정렬 라이브러리

### sorted()

- iterable 객체가 들어왔을 때 정렬된 결과를 반환

```py
>>> data = sorted([5, 6, 9, 0, 3])
>>> data
[0, 3, 5, 6, 9]
```

- key 속성을 이용해서 나이가 많은 순으로 정렬

```py
student_tuples = [
    ('john', 'A', 15),
    ('jane', 'B', 12),
    ('dave', 'B', 10),
]
result = sorted(student_tuples, key=lambda student: student[2], reverse = True)
print(result)
```

```py
# result
[('john', 'A', 15), ('jane', 'B', 12), ('dave', 'B', 10)]
```

### sort()

```py
>>> list.sort()
>>> list
[0, 1, 2, 4, 8]
>>> list.sort(reverse = True)
>>> list
[8, 4, 2, 1, 0]
```

```py
>>> keys = [{'key': 5}, {'key': 10}, {'key': 7}, {'key': 8}]
>>> keys
[{'key': 5}, {'key': 10}, {'key': 7}, {'key': 8}]
>>> keys.sort(key = lambda x:x['key'])
>>> keys
[{'key': 5}, {'key': 7}, {'key': 8}, {'key': 10}]
# keys 리스트를 'key'들의 value를 기준으로 정렬
```

#

**_Source_**

- https://github.com/ndb796/python-for-coding-test
- https://www.fun-coding.org/Chapter12-selectionsorting.html
