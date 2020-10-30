---
title: "[DS] 연결리스트(Linked list)"
date: 2020-10-30 14:10:75
category: datastructures
thumbnail: { thumbnailSrc }
draft: false
---
## Linked list

집합적으로 linear sequence를 생성하는 노드들의 집합

### Node

-   리스트의 데이터
-   데이터와 다음 노드를 가리키는 포인터로 구성


## Singly linked list

**저장 항목**

-   현재 차례에 대한 object의 참조값
-   리스트의 다음 노드에 대한 참조값

**장점**

-   사이즈가 미리 정해지지 않고 현재 element의 수에 비례하여 space 사용
-   head에 element 삽입하기 쉬움


### Traversing ( = link hopping, pointer hopping)

-   head에서부터 한 노드씩 이동
-   다음 참조값으로 null이 나오면 tail

이렇게 한 칸 씩 traversing 하는 것을 피하고 싶으면 노드 전체의 수를 세는 카운터 인스턴스를 만드는 것이 좋다.


### Singly linked list 헤드에 삽입하기

**노드 삽입 순서**

새로운 노드 생성

⇒ element에 새로운 element 배정

⇒ 현재 head를 참조하기 위한 link 생성

⇒ 리스트의 head로 새로운 노드를 가리킴

(만약 리스트가 비어있었다면 새로운 노드의 다음 참조값은 null로 설정된다.)


```
addFirst(e):
    newest = Node(e)       // 새로운 노드 인스턴스 생성
    neweset.next = head    // 옛날 head 노드를 가리킴
    head = newest          // head 새로운 노드 참조값 가리킴
    size = size + 1        // 노드 카운트 증가
```

### Singly linked list 꼬리에 삽입하기

**노드 삽입 순서**

새로운 노드 생성

⇒ 다음 참조값을 null로 설정

⇒ tail의 참조값을 새로운 노드로 설정

⇒ 리스트의 tail을 새 노드로 갱신


```
addLast(e):
    newest = Node(e)       // 새로운 노드 생성
    newest.next = null     // 새 노드의 포인터를 null로 설정
    tail.next = newest     // tail 노드 포인터 새 노드로 업데이트
    tail = newest          // tail 변수를 새로운 노드의 참조값으로 설정 
    size = size + 1        // 노드 카운트 증가
```


### Singly linked list에서 element 삭제하기

단일 연결 리스트에서 맨 처음 항목을 삭제하고 싶다면 헤드에 새로운 element를 삽입했던 과정을 반대로 수행하면 된다.

```
removeFirst():
    if head == null then
        the list is empty.
    head = head.next
    size = size - 1
```

그러나 마지막 node를 삭제하기 위해서는 head부터 traversing을 수행해 tail 전 노드로 이동해야 하기 때문에 많은 시간이 소요된다. 이러한 단점을 보완한 자료구조로는 **`doubly linked list`**가 있다.

## Singly linked list 구현하기

연결 리스트를 구현에는 **_generic framework_**와 **_nested class_**가 사용된다.

### G**eneric framework를 사용하는 이유**


리스트에서 사용자가 원하는 element type을 나타내는 **formal type parameter E**로 클래스를 정의하기 위해서이다.

### Nested class를 사용하는 이유



단일 연결 리스트 클래스 내부에 노드 클래스를 정의하는 이유는 다음과 같다.

-   노드와 링크의 세부 정보를 사용자들이 알 필요 없도록 encapsulation을 제공하기 위해서
-   Java가 node type을 다른 구조에서 정의하는 노드의 형태와 구분하도록 허락하기 위해서

## Singly Linked List 구현하기



```java
public class SinglyLinkedList<E> {
    // nested node class
    private static class Node<E> {    // 노드 객체는 외부에 노출되지 않는 것이 좋으므로 private으로 지정
        private E element;            // 데이터
        private Node<E> next;         // 다음 노드를 가리키는 포인터
        public Node(E e, Node<E> n) {
            element = e;
            next = n;
        }
        public E getElement() {return element; }
        public Node<E> getNext() {return next; }
        public void setNext(Node<E> n) { next = n; }
    }

    // 단일 연결 리스트의 인스턴스 변수 선언
    private Node<E> head = null;
    private Node<E> tail = null;
    private int size = 0;
    public SinglyLinkedList() {  }    // 생성자

    // 접근 메소드
    public int size() {return size; }
    public boolean isEmpty() {return size == 0; }
    public E first() {
        if (isEmpty()) return null;
        return tail.getElement();

    // 업데이트 메소드
    public void addFirst(E e) {     // 리스트 앞쪽에 element e 추가
        head = new Node<>(e, head); // 새로운 노드 생성 및 연결
        if (size == 0)
            tail = head;            // 특이케이스: 새로운 노드가 head이자 tail
        size++;
    }
    public void addLast(E e) {      // 리스트의 맨 뒤에 element e 추가
        Node<E> newest = new Node<>(e, null);
        if (isEmpty())
            head = newest;
        else
            tail.setNext(newest);
        tail = newest;
        size++;
    }
    public E removeFirst() {
        if (isEmpty()) 
            return null;
        E answer = head.getElement();
        head = head.getNext();            // node가 1개일 때는 null
        size--;        
        if (size == 0)
            tail = null;                    // 리스트가 비었기 때문
        return answer;
    }
}
```

#

Source: Data Structures and Algorithms in Java
