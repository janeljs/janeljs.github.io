---
title: Codility TapeEquilibrium
date: 2021-09-19 12:09:57
category: basic
thumbnail: { thumbnailSrc }
draft: false
---

- https://app.codility.com/programmers/lessons/3-time_complexity/tape_equilibrium/

## Solution

- 1차 시도: 38%
  - $O(N * N)$

```java
import java.util.*;


class Solution {
    public int solution(int[] A) {
        int sum = 0;
        int min = Integer.MAX_VALUE;
        for (int i = 0; i < A.length; i++) {
            sum += A[i];
            int rest = 0;
            for (int j = i+1; j < A.length; j++) {
                rest+=A[j];
            }
            int diff = Math.abs(sum-rest);
            min = Math.min(min, diff);
        }
        return min;
    }
}
```

- 2차 시도: 84%
  - non-empty two parts라는 문제 조건을 못 읽었다.

```java
import java.util.*;


class Solution {
    public int solution(int[] A) {
        int sum = 0;
        int min = Integer.MAX_VALUE;

        for (int i = 0; i < A.length; i++) {
            sum += A[i];
        }

        int leftSum = 0;
        int rightSum = 0;
        for (int i = 0; i < A.length; i++) {
            leftSum+=A[i];
            rightSum = sum - leftSum;
            int diff = Math.abs(leftSum - rightSum);
            if (diff < min) {
                min = diff;
            }
        }

        return min;
    }
}
```

- 3차 시도

```java
import java.util.*;


class Solution {
    public int solution(int[] A) {
        int sum = 0;
        int min = Integer.MAX_VALUE;

        for (int i = 0; i < A.length; i++) {
            sum += A[i];
        }
        int leftSum = 0;
        int rightSum = 0;

        for (int i = 1; i < A.length; i++) {
            leftSum+=A[i-1];
            rightSum = sum - leftSum;
            int diff = Math.abs(leftSum - rightSum);
            min = Math.min(min, diff);
        }

        return min;
    }
}
```
