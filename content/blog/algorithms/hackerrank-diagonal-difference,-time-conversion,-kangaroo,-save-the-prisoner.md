---
title: Hackerrank 첫 문제 풀이
date: 2021-01-27 17:01:67
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

# Hackerrank

- 알고리즘 미션으로 인해 매주 다른 플랫폼을 이용해보고 있는데, 이번주는 Hackerrank를 처음 이용해봤다.
- 항상 IntelliJ에 의존해서 코딩했었는데, 없이도 연습해야 할 것 같아서 오늘은 자동 완성 기능 없이 Hackerrank에서 바로 코딩해보았다.

## Diagonal Difference

```java
    public static int diagonalDifference(List<List<Integer>> arr) {
        // Write your code here
        int primaryDiagonal = 0;
        int secondaryDiagonal = 0;
        int size = arr.size();
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                if (i == j) {
                    primaryDiagonal += arr.get(i).get(j);
                    if (i == size - 1 - j) {
                        secondaryDiagonal += arr.get(i).get(j);
                    }
                } else if (i == size - 1 - j) {
                    secondaryDiagonal += arr.get(i).get(j);
                }
            }
        }

        return Math.abs(primaryDiagonal - secondaryDiagonal);
    }
```

## Time Conversion

```java
    static String timeConversion(String s) {
        String hour = s.substring(0, 2);
        String marker = s.substring(s.length() - 2, s.length());
        if (marker.equals("PM") && !hour.equals("12")) {
            int temp = Integer.parseInt(hour) + 12;
            hour = temp + "";
        } else if (marker.equals("AM") && hour.equals("12")) {
            hour = "00";
        }
        String answer = hour + s.substring(2, s.length() - 2);
        return answer;
    }
```

## Number Line Jumps

```java
    static String kangaroo(int x1, int v1, int x2, int v2) {
        int n = 0;
        int biggerGap = v1 > v2 ? v1 : v2;
        while (true) {
            int l1 = x1 + v1 * n;
            int l2 = x2 + v2 * n;
            if (l1 == l2) {
                return "YES";
            }
            if (l2 > l1 && v2 >= v1 || l1 > l2 && v1 >= v2) {
                return "NO";
            }
            n++;
        }
    }
```

## Save the Prisoner!

```java

    static int saveThePrisoner(int n, int m, int s) {
        int answer = m + s - 1;
        if (answer > n) {
            answer = answer % n;
        }

        return answer == 0 ? n : answer;
    }
```

#

**_Source_**

- https://www.hackerrank.com/challenges/diagonal-difference/problem
- https://www.hackerrank.com/challenges/time-conversion/problem
- https://www.hackerrank.com/challenges/kangaroo/problem
- https://www.hackerrank.com/challenges/save-the-prisoner/problem
