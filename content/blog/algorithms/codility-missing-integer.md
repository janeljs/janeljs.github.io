---
title: Codility Missing Integer
date: 2021-09-19 13:09:92
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://app.codility.com/programmers/lessons/4-counting_elements/missing_integer/

```java
import java.util.*;


class Solution {
    public int solution(int[] A) {
        int N = A.length;
        Set<Integer> set = new HashSet<>();
        for (int a : A) {
            if (a > 0) {
                set.add(a);
            }
        }
        for (int i = 1; i <= N + 1; i++) {
            if (!set.contains(i)) {
                return i;
            }
        }
        return 0;
    }
}
```

- 두 번째 풀이

```java
class Solution {
    public int solution(int[] A) {
        int pointer = 1;

        Arrays.sort(A);

        for (int i = 0; i < A.length; i++)
        {
            if (A[i] <= 0)
                continue;
            else if (A[i] == pointer) {
                pointer++;
            }
        }

        return pointer;
    }
}
```
