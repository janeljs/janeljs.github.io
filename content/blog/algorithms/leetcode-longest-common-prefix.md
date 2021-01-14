---
title: LeetCode Longest Common Prefix
date: 2021-01-14 10:01:19
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

## Description

```py
Write a function to find the longest common prefix string amongst an array of strings.
If there is no common prefix, return an empty string "".

Example 1:

Input: strs = ["flower","flow","flight"]
Output: "fl"
```

## Constraints

```py
0 <= strs.length <= 200
0 <= strs[i].length <= 200
strs[i] consists of only lower-case English letters.
```

## Solution

```java
public class Solution {
    public String longestCommonPrefix(String[] strs) {
        if (strs.length != 0) {
            int index = 0;
            String first = strs[0];
            outerloop:
            for (int i = 0; i < first.length(); i++) {
                for (String x : strs) {
                    if (i < x.length()) {
                        if (first.charAt(i) == x.charAt(i)) {
                            index = i;
                        } else {
                            index = i - 1;
                            break outerloop;
                        }
                    } else {
                        index = i - 1;
                        break outerloop;
                    }
                }
            }
            if (first.length() != 0) {
                return first.substring(0, index + 1);
            } else {
                return "";
            }
        }
        return "";
    }
}
```

## Feedback

```java
// 풀이 1

 public String longestCommonPrefix(String[] strs) {
    if (strs.length == 0) return "";
    String prefix = strs[0];
    for (int i = 1; i < strs.length; i++)
        while (strs[i].indexOf(prefix) != 0) {
            prefix = prefix.substring(0, prefix.length() - 1);
            if (prefix.isEmpty()) return "";
        }
    return prefix;
}

```

```java
// 풀이 2

public String longestCommonPrefix(String[] strs) {
    if (strs == null || strs.length == 0) return "";
    for (int i = 0; i < strs[0].length() ; i++){
        char c = strs[0].charAt(i);
        for (int j = 1; j < strs.length; j ++) {
            if (i == strs[j].length() || strs[j].charAt(i) != c)
                return strs[0].substring(0, i);
        }
    }
    return strs[0];
}
```

#

**_Source_**

- https://leetcode.com/problems/longest-common-prefix/
