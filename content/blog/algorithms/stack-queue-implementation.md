---
title: "스택으로 큐 구현하기(Implementing a queue with stacks)"
date: 2020-10-31 11:10:43
category: algorithms
thumbnail: { thumbnailSrc }
draft: false
---
## ❓스택을 이용하여 큐를 구현하려면 어떻게 해야할까?

1. 스택을 두 개 만든다.
2. 첫 번째 스택에 데이터를 push한다.
3. 두 번째 스택이 비어있다면 첫 번째 스택에서 pop한 값을 두 번째 스택에 push해준다. 이렇게 하면 스택 a에 마지막으로 넣었던 값이 스택 b의 맨 아래 깔리게 된다.
4. 스택 b에 있는 값을 pop하면 pop할 때마다 스택 a에 첫 번째로 push했던 값이 나온다. 

💡 스택은 FILO, 큐는 FIFO의 형태를 취하는데 이렇게 스택 두 개를 이용하면 스택으로 큐를 구현할 수 있다.

## 구현

```java
public class Queue<E> {
	Stack<E> a = new Stack<>();
	Stack<E> b = new Stack<>();

	void Enqueue(E data) {
		a.push(data);
	}

	E Dequeue() {

		if (b.isEmpty() == true) {
			while (!a.empty()) {
				b.push(a.pop());
			}
		}

		E data = b.pop();
		
		return data;
	}
}
```
