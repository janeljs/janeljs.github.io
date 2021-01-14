---
title: LeetCode Reverse Integer
date: 2021-01-14 09:01:50
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

## Description

```py
Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

Example 1:

Input: x = 123
Output: 321
```

## Constraints

```py
-231 <= x <= 231 - 1
```

## Solution

```java
class Solution {
    public int reverse(int x) {
        String num = x + "";
        String temp = "";
        String plusminus = "";
        for (int i = num.length()-1; i >=0; i--) {
            if (!isInteger(num.charAt(i) + "")) {
                plusminus += num.charAt(i);
            }
            else {
                temp += num.charAt(i);
            }
        }
        int answer = 0;
        if (isInteger(plusminus+temp)) {
            answer = Integer.parseInt(plusminus + temp);
        }
        return answer;
    }

    boolean isInteger(String s) {
        try {
            Integer.parseInt(s);
        } catch (NumberFormatException e) {
            return false;
        }
        return true;
    }
}
```

## Feedback

```java
class Solution {
    public int reverse(int x) {
        int rev = 0;
        while (x != 0) {
            int pop = x % 10;
            x /= 10;
            if (rev > Integer.MAX_VALUE/10 || (rev == Integer.MAX_VALUE / 10 && pop > 7)) return 0;
            if (rev < Integer.MIN_VALUE/10 || (rev == Integer.MIN_VALUE / 10 && pop < -8)) return 0;
            rev = rev * 10 + pop;
        }
        return rev;
    }
}
```

#

**_Source_**

- https://leetcode.com/problems/reverse-integer/
