---
title: Codility OddOccurrencesInArray
date: 2021-09-19 10:09:97
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://app.codility.com/programmers/lessons/2-arrays/odd_occurrences_in_array/

## Solution

- 1차 시도: 66%

```java
import java.util.*;


class Solution {
    public int solution(int[] A) {
        Map<Integer, List<Integer>> map = new HashMap<>();
        for (int i = 0; i < A.length; i++) {
            if (map.get(A[i])==null) {
                List<Integer> list = new ArrayList<>();
                list.add(i);
                map.put(A[i], list);
            } else {
                List<Integer> current = map.get(A[i]);
                current.add(i);
            }
        }

        for (Map.Entry<Integer, List<Integer>> entry:map.entrySet()) {
            if (entry.getValue().size()<2) {
                return entry.getKey();
            }
        }

        return 0;

    }
}
```

- 2차 시도
  - 홀수 면서 3개 이상인 경우도 생각해주어야 한다.

```java
import java.util.*;


class Solution {
    public int solution(int[] A) {
        Map<Integer, Integer> map = new HashMap<>();
        for (int i = 0; i < A.length; i++) {
            if (map.get(A[i])==null) {
                map.put(A[i], 1);
            } else {
                int current = map.get(A[i]);
                map.put(A[i], ++current);
            }
        }

        for (Map.Entry<Integer, Integer> entry:map.entrySet()) {
            if (entry.getValue() % 2 !=0) {
                return entry.getKey();
            }
        }

        return 0;

    }
}
```

- 비트 연산을 이용한 풀이

```java
class Solution {
    public int solution(int[] A) {
        int res = 0;

        for(int i= 0; i < A.length; i++){
            res = res ^ A[i];
        }
        return res;
    }
}
```
