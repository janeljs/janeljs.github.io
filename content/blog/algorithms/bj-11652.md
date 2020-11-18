---
title: 백준 11652번 카드(Card)
date: 2020-11-18 13:11:64
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---
## Description

```
준규는 숫자 카드 N장을 가지고 있다. 숫자 카드에는 정수가 하나 적혀있는데, 적혀있는 수는 -2^62보다 크거나 같고, 2^62보다 작거나 같다.

준규가 가지고 있는 카드가 주어졌을 때, 가장 많이 가지고 있는 정수를 구하는 프로그램을 작성하시오. 만약, 가장 많이 가지고 있는 정수가 여러 가지라면, 작은 것을 출력한다.
```
## Input
```
첫째 줄에 준규가 가지고 있는 숫자 카드의 개수 N (1 ≤ N ≤ 100,000)이 주어진다. 둘째 줄부터 N개 줄에는 숫자 카드에 적혀있는 정수가 주어진다.
```

## Output
```
첫째 줄에 준규가 가장 많이 가지고 있는 정수를 출력한다.
```

## Solution
1. 카드에 적힌 정수를 key에 저장하고 동일한 수를 저장하는 카드의 수를 value에 저장하는 hashmap을 사용하여 문제를 해결할 수 있다.
	- 자바에서는 Map Interface를 상속하고있는 HashMap과 Hashtable 자료구조를 제공하고 있다.
	- HashMap과 Hashtable의 차이는 동기화(Synchronization) 지원 여부이다.
	- HashMap은 동기화를 지원하지 않는대신 Hashtable보다 더 빠르다.
	- HashMap의 값은 중복저장될 수 있지만 키는 중복저장될 수 없다. 
2. 숫자 카드에 적혀있는 정수의 값이 int형의 범위(-2의31제곱~2의31제곱-1)를 넘어서기 때문에 key의 자료형을 long으로 선언해주어야 한다. 
3. 많은 테스트케이스에 대비하여 scanner보다는 bufferedreader로 입력을 받아오면 좋다.

```java
// 내 풀이
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;


public class Main {

	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int num = Integer.parseInt(br.readLine());
		HashMap<Long, Integer> map = new HashMap<>();

		for (int i = 0; i < num; i++) {

			long key = Long.parseLong(br.readLine());
			if (map.containsKey(key)) {
				int count = map.get(key) + 1;
				map.put(key, count);
			} else {
				int count = 1;
				map.put(key, count);
			}

		}

		int max = 0;
		long key_save = 0;
		long answer = 0;

		for (Long key : map.keySet()) {
			if (map.get(key) > max) {
				max = map.get(key);
				key_save = key;
				answer = key;

			} else if (map.get(key) == max) {
				if (key < key_save) {
					max = map.get(key);
					key_save = key;
					answer = key;
				}

			}

		}

		System.out.println(answer);

	}
}

```
## Feedback
파이썬으로 풀면 훨씬 간단하게 풀 수 있다. 

```python
# 다른 사람 풀이 

import sys
input=sys.stdin.readline
d={}
for _ in range(int(input())):
    t=int(input())
    d[t]=d.get(t,0)+1

print(max(sorted(d.keys()),key=lambda x:d[x]))

```






#

***Source***

- [백준 11652번 카드](https://www.acmicpc.net/problem/11652)
- [Hashmap vs Hashtable](https://odol87.tistory.com/3)
- [Hashmap method](https://vaert.tistory.com/107)
- [자바 기본자료형 크기](https://aventure.tistory.com/59)
- [HashMap 코딩팩토리](https://coding-factory.tistory.com/556)