# 쉘 스크립트
## 변수

```
#!/bin/bash
echo "스크립트 이름: $0"
echo "첫번째값: $1"
echo "두번째값: $2"
echo "전체 인자 개수: $#"
echo "전체인자: $@"


```
```
[root@localhost ~]# cat variable_test3.sh
#!/bin/bash

read -s -p "숫자 입력 하세요" A
read -s -p "숫자 입력 하세요" B

echo "A + B = $((A+B))"
echo "A - B = $((A-B))"
echo "A * B = $((A*B))"
echo "A / B = $((A/B))"

```
```sh
./ping.sh serverlist.txt
```