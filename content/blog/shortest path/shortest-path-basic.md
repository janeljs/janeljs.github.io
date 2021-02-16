---
title: 이코테 Chapter 9 최단 경로
date: 2021-02-14 04:02:46
category: shortest path
thumbnail: { thumbnailSrc }
draft: false
---

## 최단 경로 알고리즘

- 가장 짧은 경로를 찾는 알고리즘
- 그리디 알고리즘과 다이나믹 프로그래밍 알고리즘이 적용된다.

## 다익스트라 최단 경로 알고리즘

- 그래프에서 여러 개의 노드가 있을 때, 특정한 노드에서 출발하여 다른 노드로 가는 각각의 최단 경로를 구해주는 알고리즘
- 동작 과정
  1. 출발 노드를 설정한다.
  2. 최단 거리 테이블(1차원 리스트)을 초기화한다.  
     &rarr; 출발 노드에서 다른 모든 노드로 가는 최단 거리를 무한`int(1e9)`으로 초기화
  3. 방문하지 않은 노드 중에서 최단 거리가 가장 짧은 노드를 선택한다.
  4. 해당 노드를 거쳐 다른 노드로 가는 비용을 계산하여 최단 거리 테이블을 갱신한다.
  5. 위 과정에서 3번과 4번을 반복한다.