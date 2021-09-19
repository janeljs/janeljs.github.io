---
title: Codility PermMissingElem
date: 2021-09-19 11:09:46
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://app.codility.com/programmers/lessons/3-time_complexity/perm_missing_elem/

## Solution

```java
import java.util.*;

class Solution {
    public int solution(int[] A) {

        Arrays.sort(A);

        for (int i=1; i<=A.length;i++) {
            if (i!=A[i-1]) {
                return i;
            }
        }

        return A.length+1;
    }
}
```
