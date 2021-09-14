---
title: Codility CyclicRotation
date: 2021-09-14 11:09:18
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://app.codility.com/programmers/lessons/2-arrays/

## Solution

```java
import java.util.*;
import java.util.stream.*;

class Solution {
    public int[] solution(int[] A, int K) {

        if (A.length==0 || K==0) {
            return A;
        }

        K = K % A.length;

        int[] a = Arrays.copyOfRange(A, A.length - K, A.length);

        int[] b = Arrays.copyOfRange(A, 0, A.length - K);

        return IntStream.concat(Arrays.stream(a), Arrays.stream(b)).toArray();
    }
}
```
