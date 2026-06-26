# 01 스크립트

왜 시스템 관리자는 스크립트를 알아야 하는가
- 요즘은 Python 같은 고급 프로그래밍 언어가 널리 사용된다.
복잡한 프로그램을 만들거나, 데이터를 정교하게 처리하거나, 큰 규\모의 자동화 시스템을 구성할 때 Python은 매우 강력한 도구다.
- 하지만 시스템 관리자에게는 여전히 Shell Script 가 필요하다.
특히 리눅스 환경에서는 스크립트를 알고 있느냐에 따라 작업 속도와 문제 해결 능력이 크게 달라진다.
- 별도의 설치 없이 바로 사용할 수 있다.
- 리눅스 명령어와 바로 연결된다.
- 원하는 결과를 빠르게 확인할 수 있다.
    ```bash
    df -h 
    ps aux | grep hpptd
    cat /etc/passwd | cut -d: -f1
    ```
- 시스템에 문제가 발생했을 때는 시간이 중요하다.
```bash
df -h
du -sh /var/log/*
ps aux --sort=%mem | head
```

# 시스템 관리에 자주 쓰는 기본 명령어
## 따옴표

## 입출력 재지정 (Redirection)


## chomod

setUID
setGID

## chown
- chown 은 파일 소유자 및 소유 그룹을 바꾸기 위한 명령어
- root 사용자만 사용가능
- -R 옵션으로 디렉토리 안에 있는 모든 파일 및 디렉토리의 소유자와 소유 그룹을 바꿈
## diff & cmp

diff -u 많이 씀

v
패치파일생성

# 03 텍스트 처리 명령어:
grep, cut ,awk, sed
## grep
- grep 은 파일이나 명령어 출력결과에서 특정 문자열이나 패턴이 포함된 줄ㅇ르 앚아 출력하는 명령어
- 

```sh
[root@localhost ~]# grep -n 'PermitRootLogin' /etc/ssh/sshd_config
44:PermitRootLogin yes
96:# the setting of "PermitRootLogin without-password".
[root@localhost ~]#
```

```
 grep -E 'nologin|false' /etc/passwd
 ```

```sh grep 첫문자 끝문자 찾기
[root@localhost ~]# grep '^root' /etc/passwd
root:x:0:0:root:/root:/bin/bash

[root@localhost ~]# grep 'bash$' /etc/passwd
root:x:0:0:root:/root:/bin/bash
```
빈줄찾기
주석이 아닌 설정줄 찾기

```sh
[root@localhost ~]# grep -Ev '^#|^$' /etc/ssh/sshd_config
HostKey /etc/ssh/ssh_host_rsa_key
HostKey /etc/ssh/ssh_host_ecdsa_key
HostKey /etc/ssh/ssh_host_ed25519_key
SyslogFacility AUTHPRIV
PermitRootLogin yes
AuthorizedKeysFile      .ssh/authorized_keys
PasswordAuthentication yes
ChallengeResponseAuthentication no
GSSAPIAuthentication yes
GSSAPICleanupCredentials no
UsePAM yes
X11Forwarding yes
PrintMotd no
AcceptEnv LANG LC_CTYPE LC_NUMERIC LC_TIME LC_COLLATE LC_MONETARY LC_MESSAGES
AcceptEnv LC_PAPER LC_NAME LC_ADDRESS LC_TELEPHONE LC_MEASUREMENT
AcceptEnv LC_IDENTIFICATION LC_ALL LANGUAGE
AcceptEnv XMODIFIERS
Subsystem       sftp    /usr/libexec/openssh/sftp-server
```


`grep -Ev '^[[:space:]]*#|^$` /etc/ssh/sshd_config`

tr diff

grep 과 파이프

||----||----||
|grep| 원하는 줄 찾기 |
|cut| 필요한 칼럼 잘라내기|
awk |조건 처리와 출력|
sed |줄 단위 편집| 줄, 패턴| 치환

```
cut -c 21 /etc/redhat-release
```

```
[root@localhost ~]# echo "root:x:0:0:root:/root:/bin/bash" |awk -F: '{print $1, $3, $7}'
root 0 /bin/bash
```

```
[root@localhost ~]# cat tab.txt
kim     90      80
lee 70 60
park    100     95
[root@localhost ~]# awk -F'\t' '{print $1,$2,$3}' tab.txt
kim 90 80
lee 70 60
park    100     95
```

```sh cpu 사용율이 0.2 이상이 프로세스
[root@localhost ~]# ps aux | awk 'NR > 1 {if ($3 >=0.2) print $1, $2, $3, $11}'
root 845 0.2 /usr/libexec/platform-python\
```

```sh 디스크 사용량이 5% 이상인 
[root@localhost ~]# df -h | awk 'NR > 1 {if ($5+0 >= 5) print $6, "위험"; else print $6, "정상"}'
/dev 정상
/dev/shm 정상
/run 정상
/sys/fs/cgroup 정상
/ 위험
/home 정상
/boot 위험
/boot/efi 정상
/run/user/0 정상
```

```bash 스트레스 테스트
dnf install stress-ng
stress-ng --cpu 1 --vm 2 --vm-bytes 128M
ps aux| awk 'NR > 1 && $3 >=5 {printf "%-12s %-8s %-8s %s\n",$1 ,$2, $4, $11}'
ps aux| awk 'NR > 1 {for (i=11;i<=NF;i++) printf"%s",$i; print ""}'

```
```
[root@localhost ~]# sed 's/linux/Linux/3' sed_test.txt
linux linux Linux
```


실습해야 할것
117 인포넣기
 sed '' sed_test_3.txt
116 디렉토리 구분자 변경


# 4. 쉘 스크립트

스크립트
- 스크립트의 첫줄은 Shebang 이라함
- Shebang 은 이 스크립트를  어떤 셀뤠


```
bash -n ./debug_test_1.sh
bash -x ./debug_test_1.sh
```

```sh
for user in $(cut -d: -f1 /etc/passwd); do echo $user; done)
```


```while read line; do echo "서버이름: $line"; done < server_list.txt
```
