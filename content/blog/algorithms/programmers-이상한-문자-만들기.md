---
title: Programmers 이상한 문자 만들기
date: 2021-01-20 21:01:50
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

## Description

```py
문자열 s는 한 개 이상의 단어로 구성되어 있습니다. 각 단어는 하나 이상의 공백문자로 구분되어 있습니다. 각 단어의 짝수번째 알파벳은 대문자로, 홀수번째 알파벳은 소문자로 바꾼 문자열을 리턴하는 함수, solution을 완성하세요.
```

## Constraints

```py
문자열 전체의 짝/홀수 인덱스가 아니라, 단어(공백을 기준)별로 짝/홀수 인덱스를 판단해야합니다.
첫 번째 글자는 0번째 인덱스로 보아 짝수번째 알파벳으로 처리해야 합니다.
```

## Solution

```java
// 내 풀이

class Solution {
    public String solution(String s) {
        StringBuilder answer = new StringBuilder();
        String fake = s + "&";
        String[] arr = fake.split(" ");
        for (int i = 0; i < arr.length; i++) {
            for (int j = 0; j < arr[i].length(); j++) {
                if (j % 2 == 0) {
                    answer.append(String.valueOf(arr[i].charAt(j)).toUpperCase());
                } else {
                    answer.append(String.valueOf(arr[i].charAt(j)).toLowerCase());
                }
            }
            if (i != arr.length - 1) {
                answer.append(" ");
            }
        }
        return answer.toString().substring(0,answer.toString().length()-1);
    }
}
```

## Feedback

-

```java
// 풀이 1


```

```java
// 풀이 2


```

#

**_Source_**

- https://programmers.co.kr/learn/courses/30/lessons/12930
