---
title: "백준 2798번 블랙잭(Blackjack)"
date: 2020-11-01 21:11:91
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---

## Description

```
In “Blackjack”, a popular card game, the goal is to have cards which sum up to largest number not exceeding 21. Mirko came up with his own version of this game.

In Mirko‟s game, cards have positive integers written on them. The player is given a set of cards and an integer M. He must choose three cards from this set so that their sum comes as close as possible to M without exceeding it. This is not always easy since there can be a hundred of cards in the given set.

Help Mirko by writing a program that finds the best possible outcome of given game.
```
## Input
```
The first line of input contains an integer N (3 ≤ N ≤ 100), the number of cards, and M (10 ≤ M ≤ 300 000), the number that we must not exceed.

The following line contains numbers written on Mirko‟s cards: N distinct space-separated positive integers less than 100 000.

There will always exist some three cards whose sum is not greater than M.
```

## Output
```
The first and only line of output should contain the largest possible sum we can obtain.
```

## Solution


```python
# 내 풀이

n_and_m = list(map(int, input().split(' ')))
num_in_cards = list(map(int, input().split(' ')))

largest_m = 0

for x in range(0, len(num_in_cards)):
    for y in range(x+1, len(num_in_cards)):
        for z in range(y+1, len(num_in_cards)):
            sum = num_in_cards[x] + num_in_cards[y] + num_in_cards[z]
            if sum <= n_and_m[1] and sum >= largest_m:
                largest_m = sum
                          
print(largest_m)

```
## Feedback

```python
# 다른 사람 풀이 

n, m = list(map(int, input().split(' '))) # ','로 각각 데이터 할당 가능
data = list(map(int, input().split(' '))) # 변수명 길이 적당

result = 0
length = len(data) # 미리 변수 할당해주기 

for i in range(0, length): # range는 마지막 값 제외
	for j in range(i + 1, length):
		for k in range(j + 1, length):
			sum_value = data[i] + data[j] + data[k]
			if sum_value <= m:
				result = max(result, sum_value) # max 함수 사용 

print(result)

```

#

***Source***

[백준 2798번 블랙잭](https://www.acmicpc.net/problem/2798)
