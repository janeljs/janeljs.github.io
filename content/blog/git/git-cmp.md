---
title: "[git] git add, commit, push 한 번에 하는 방법" 
date: 2020-11-04 06:11:39
category: git
thumbnail: { thumbnailSrc }
draft: false
---

> 외계어처럼만 느껴지던 git 명령어를 하나 둘 배우고 commit하는 재미에 푹 빠져있었는데, 1일1커밋을 하다보니 매번 add-commit-push하는 과정이 귀찮게 느껴졌다. 구글링을 해보니 아래와 같이 간단하게 cmp 명령어를 등록할 수 있었다.   

## 따라해보자! Follow me 😎

1. cmd 창에서 아래 코드를 작성해준다.

```bash
git config --global alias.cmp '!f() { git add -A && git commit -m "$@" && git push; }; f'
```

2. add-commit-push 대신 `git cmp`만 입력해주면 된다.

```bash
git cmp "커밋 메시지"
```

#