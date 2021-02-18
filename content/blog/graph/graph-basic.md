---
title: 이코테 Chapter 10 그래프 이론 (1)
date: 2021-02-19 00:02:26
category: graph
thumbnail: { thumbnailSrc }
draft: false
---

## 서로소 집합(Disjoint Sets)

- 공통 원소가 없는 두 집합
- 서로소 집합 자료구조: 서로소 부분 집합들로 나누어진 원소들의 데이터를 처리하기 위한 자료구조
  &rarr; 합집합(union)과 찾기(find) 연산으로 조작하기 때문에 union-find 자료구조라고도 부른다.
  - union: 두 개별 집합을 하나의 집합으로 합치는 연산
  - find: 특정한 원소가 속한 집합이 어떠한 집합인지 알려주는 연산

## union-find 알고리즘

- union
  1. A와 B의 루트 노드를 찾는다.
  2. A의 루트 노드를 B의 부모 노드로 설정한다.
  3. 모든 union 연산을 처리할 때까지 1번과 2번을 반복한다.

### 구현
