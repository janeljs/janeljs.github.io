---
title: Programmers 수식 최대화
date: 2021-07-23 03:07:82
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

- https://programmers.co.kr/learn/courses/30/lessons/67257

## Solution

```py
from itertools import permutations
import copy


def solution(expression):
    answer = 0
    ops = ['+', '-', '*']
    ops_priorities_pm = list(permutations(ops))

    n_stack = []
    op_stack = []
    mark = 0

    for i in range(len(expression)):
        if expression[i] in ops:
            n_stack.append(expression[mark:i])
            op_stack.append(expression[i])
            mark = i + 1
    n_stack.append(expression[mark:len(expression)])

    n_stack = list(map(int, n_stack))

    for ops_tuple in ops_priorities_pm:
        current_op_priority = list(ops_tuple)
        op_temp = copy.deepcopy(op_stack)
        n_temp = copy.deepcopy(n_stack)
        for op in current_op_priority:
            print(op)
            idx = 0

            while idx < len(op_temp):
                if op == op_temp[idx]:
                    n_temp[idx] = calculate(n_temp[idx], n_temp[idx + 1], op_temp[idx])
                    n_temp.pop(idx + 1)
                    op_temp.pop(idx)
                    idx -= 1
                idx += 1
        answer = max(answer, abs(n_temp[0]))

    return answer


def calculate(x, y, op):
    if op == '+':
        return x + y
    if op == '-':
        return x - y
    return x * y
```

- [파이썬 eval 함수](https://blockdmask.tistory.com/437)
- 다른 사람 풀이 1

```py
def solution(expression):
    operations = [('+', '-', '*'),('+', '*', '-'),('-', '+', '*'),('-', '*', '+'),('*', '+', '-'),('*', '-', '+')]
    answer = []
    for op in operations:
        a = op[0]
        b = op[1]
        temp_list = []
        for e in expression.split(a):
            temp = [f"({i})" for i in e.split(b)]
            temp_list.append(f'({b.join(temp)})')
        answer.append(abs(eval(a.join(temp_list))))
    return max(answer)
```

- 다른 사람 풀이 2

```py
import re
from itertools import permutations

def solution(expression):
    #1
    op = [x for x in ['*','+','-'] if x in expression]
    op = [list(y) for y in permutations(op)]
    ex = re.split(r'(\D)',expression)

    #2
    a = []
    for x in op:
        _ex = ex[:]
        for y in x:
            while y in _ex:
                tmp = _ex.index(y)
                _ex[tmp-1] = str(eval(_ex[tmp-1]+_ex[tmp]+_ex[tmp+1]))
                _ex = _ex[:tmp]+_ex[tmp+2:]
        a.append(_ex[-1])

    #3
    return max(abs(int(x)) for x in a)
```
