---
title: "백준 5397번 키로거(Keylogger)"
date: 2020-11-18 16:11:61
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---
## Description

```

As a malicious hacker you are trying to steal your mother’s password, and therefore you have installed a keylogger on her PC (or Mac, so you like). You have a log from your mother typing the password, but unfortunately the password is not directly visible because she used the left and right arrows to change the position of the cursor, and the backspace to delete some characters. Write a program that can decode the password from the given keylog.

```

## Input

```

The ﬁrst line of the input contains a single number: the number of test cases to follow. Each test case has the following format:

One line with a string L, satisfying 1 ≤ Length(L) ≤ 1,000,000, consisting of:

’-’ representing backspace: the character directly before the cursor position is deleted, if there is any.

’<’ (and ’>’) representing the left (right) arrow: the cursor is moved 1 character to the left (right), if possible.

alphanumeric characters, which are part of the password, unless deleted later. We assume ‘insert mode’: if the cursor is not at the end of the line, and you type an alphanumeric character, then all characters after the cursor move one position to the right.

Every decoded password will be of length > 0.

```

## Output

```

For every test case in the input, the output should contain a single string, on a single line: the decoded password.

```

## Solution
- 커서 왼쪽과 오른쪽에 stack이 있다고 생각하면 문제를 쉽게 풀 수 있다. 


```python

# 내 풀이

input_num = int(input())

for x in range(input_num):
    pw = input()
    left_stack = []
    right_stack = []
    for i in pw:
        if i == "<":
            if left_stack: # stack이 비어있는지 확인
                right_stack.append(left_stack.pop())
        elif i == ">":
            if right_stack:
                left_stack.append(right_stack.pop())
        elif i == "-":
            if left_stack:
                left_stack.pop()
        else: 
            left_stack.append(i)

    left_stack.extend(reversed(right_stack)) # 두 stack 합치기
    print("".join(left_stack))

```

## Feedback
- `str.rstrip([chars])` : 문자열의 지정된 문자열 끝을 삭제 (기본값: 공백)

```python

# 다른 사람 풀이

import sys
input = sys.stdin.readline

def solve():
    front = []
    back = []
    for char in input().rstrip():
        if char in '<>-':
            if char == '<':
                if front:
                    back.append(front.pop())
            elif char == '>':
                if back:
                    front.append(back.pop())
            else:
                if front:
                    front.pop()
        else:
            front.append(char)
    print(''.join(front), ''.join(back[::-1]), sep='')


if __name__ == '__main__':
    t = int(input())
    for _ in range(t):
        solve()
```

#

***Source***

- [백준 5397](https://www.acmicpc.net/problem/5397)
- [python rstrip](http://www.w3big.com/ko/python/att-string-rstrip.html)