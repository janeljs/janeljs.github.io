---
title: LeetCode Palindrome Number
date: 2021-01-14 10:01:04
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

## Description

```py
Given an integer x, return true if x is palindrome integer.
An integer is a palindrome when it reads the same backward as forward. For example, 121 is palindrome while 123 is not.

Example 1:

Input: x = 121
Output: true
```

## Constraints

```py
-231 <= x <= 231 - 1
```

## Solution

```java
class Solution {
    public boolean isPalindrome(int x) {
        boolean answer = strIsPalindrome(String.valueOf(x));
        return answer;
    }
    public boolean strIsPalindrome(String s) {
        if (s.length() <= 1) {
            return true;
        }
        if (s.charAt(0) == s.charAt(s.length() - 1)) {
            return strIsPalindrome(s.substring(1, s.length() - 1));
        }
        return false;
    }
}
```

## Feedback

```java
public boolean isPalindrome(int num){
   if(num < 0) return  false;
   int reversed = 0, remainder, original = num;
   while(num != 0) {
        remainder = num % 10; // reversed integer is stored in variable
        reversed = reversed * 10 + remainder; //multiply reversed by 10 then add the remainder so it gets stored at next decimal place.
        num  /= 10;  //the last digit is removed from num after division by 10.
    }
    // palindrome if original and reversed are equal
    return original == reversed;
}
```

#

**_Source_**

- https://leetcode.com/problems/palindrome-number/
