---
title: "백준 1715번 카드 정렬하기"
date: 2020-11-04 23:11:98
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---


## Description

```
정렬된 두 묶음의 숫자 카드가 있다고 하자. 각 묶음의 카드의 수를 A, B라 하면 보통 두 묶음을 합쳐서 하나로 만드는 데에는 A+B 번의 비교를 해야 한다. 이를테면, 20장의 숫자 카드 묶음과 30장의 숫자 카드 묶음을 합치려면 50번의 비교가 필요하다.

매우 많은 숫자 카드 묶음이 책상 위에 놓여 있다. 이들을 두 묶음씩 골라 서로 합쳐나간다면, 고르는 순서에 따라서 비교 횟수가 매우 달라진다. 예를 들어 10장, 20장, 40장의 묶음이 있다면 10장과 20장을 합친 뒤, 합친 30장 묶음과 40장을 합친다면 (10+20)+(30+40) = 100번의 비교가 필요하다. 그러나 10장과 40장을 합친 뒤, 합친 50장 묶음과 20장을 합친다면 (10+40)+(50+20) = 120 번의 비교가 필요하므로 덜 효율적인 방법이다.

N개의 숫자 카드 묶음의 각각의 크기가 주어질 때, 최소한 몇 번의 비교가 필요한지를 구하는 프로그램을 작성하시오.
```
## Input
```
첫째 줄에 N이 주어진다. (1≤N≤100,000) 이어서 N개의 줄에 걸쳐 숫자 카드 묶음의 각각의 크기가 주어진다.
```

## Output
```
첫째 줄에 최소 비교 횟수를 출력한다. (21억 이하)
```

## Solution
1. Priority Queue에 카드 묶음의 수를 전부 add한다.
2. Priority Queue 특성을 이용해 가장 작은값과 그 다음 작은값을 빼내(remove) 더한다. 
3. 더한 값을 다시 Priority Queue에 넣는다.
4. 2번의 과정을 반복하다가 Priority Queue에 하나의 원소만 남으면 반복을 종료하고 총합을 출력한다. 



```java
// 내 풀이

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Collections;
import java.util.PriorityQueue;
import java.util.StringTokenizer;

public class Main {

	public static void main(String[] args) throws IOException {

		BufferedReader br = new BufferedReader(new InputStreamReader(System.in)); // Scanner에 비해 시간 단축 가능
		StringTokenizer st = new StringTokenizer(br.readLine());

		int n = Integer.parseInt(st.nextToken()); // 카드 묶음의 수 저장

		PriorityQueue<Integer> pq = new PriorityQueue<>();

		for (int i = 0; i < n; i++) {
			StringTokenizer st2 = new StringTokenizer(br.readLine());
			int data = Integer.parseInt(st2.nextToken());
			pq.add(data);	
		}
		
		int a = 0;
		int b = 0;
		int sum = 0;
		
		while(pq.size()!=1) { 
			a = pq.remove();
			b = pq.remove();
			sum += a+b;
			pq.add(a+b);
			
		}
			
		System.out.println(sum);
	}
}

```
## Feedback

- python과 java 두 가지 언어를 사용하니 헷갈린다. python 쓴다고 java 좀 안 썼더니 그새 어색하다. 영어와 한국어처럼 둘 다 내가 생각하는 바는 바로 구현할 수 있는 수준으로 연습해야겠다.
- 문제 푸는 시간을 줄여야 한다. 


#

***Source***

[백준 1715번 카드 정렬하기](https://www.acmicpc.net/problem/1715)