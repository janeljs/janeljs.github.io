---
title: Codility BinaryGap
date: 2021-09-14 11:09:29
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://app.codility.com/programmers/lessons/1-iterations/

## Soltuion

```java
class Solution {
    public int solution(int N) {
        // write your code in Java SE 8
        String binS = Integer.toBinaryString(N);

        boolean start = false;

        int idx = 0;
        int count = 0;
        int max = 0;
        while(idx < binS.length()) {

            if (binS.charAt(idx)=='1') {
                if (!start) {
                    start = true;
                }
                max = Math.max(max, count);
                count = 0;

            }

            if (start==true && binS.charAt(idx)=='0') {
                count ++;
            }

            idx++;
        }

        return max;
    }
}
```

- 다른 사람 풀이

```java
class Solution {
    public int solution(int N) {
        int maxBinaryGap = 0;
        int countBinaryGap = 0;
        boolean isCounting = false;

        while(true) {
            if((N & 1) == 1) {
                if(!isCounting) {
                    isCounting = true;
                }
                else {
                    if(countBinaryGap > maxBinaryGap)
                        maxBinaryGap = countBinaryGap;
                }
                countBinaryGap = 0;
            }else {
                countBinaryGap++;
            }
            N = N >> 1;
            if(N == 0)
                break;
        }
        return maxBinaryGap;
    }
}
```
