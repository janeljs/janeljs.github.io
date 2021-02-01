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

#

**_Source_**

- https://github.com/ndb796/python-for-coding-test
- https://www.fun-coding.org/Chapter12-selectionsorting.html
