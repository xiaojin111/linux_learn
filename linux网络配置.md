#### 查看网络配置

1. 使用ifconfig查看网络接口地址

```bash
ifconfig
enp2s0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.1.5  netmask 255.255.255.0  broadcast 192.168.1.255
        inet6 fe80::54ae:a95c:a157:3057  prefixlen 64  scopeid 0x20<link>
        ether d4:5d:64:28:49:12  txqueuelen 1000  (以太网)
        RX packets 13971679  bytes 5242116144 (5.2 GB)
        RX errors 0  dropped 1390442  overruns 0  frame 0
        TX packets 12828732  bytes 4349664763 (4.3 GB)
        TX errors 5  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (本地环回)
        RX packets 8283221  bytes 1289943531 (1.2 GB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 8283221  bytes 1289943531 (1.2 GB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

eth0:第1块以太网卡名称

lo:回环网络接口，一个虚拟网络接口，用于本机测试

```bash
#查看所有网络接口信息
ifconfig -a
```

查看指定网络接口信息

```bash
ifconfig eth0
enp2s0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.1.5  netmask 255.255.255.0  broadcast 192.168.1.255
        inet6 fe80::54ae:a95c:a157:3057  prefixlen 64  scopeid 0x20<link>
        ether d4:5d:64:28:49:12  txqueuelen 1000  (以太网)
        RX packets 13972935  bytes 5242556905 (5.2 GB)
        RX errors 0  dropped 1390587  overruns 0  frame 0
        TX packets 12829741  bytes 4349934819 (4.3 GB)
        TX errors 5  dropped 0 overruns 0  carrier 0  collisions 0
```

ether:表示网络接口的物理地址MAC

inet:表示网络接口的IP地址

broadcast:表示网络接口所在网络的广播地址

netmask:表示网络接口的子网掩码

2. 使用ip/ethtool命令查看网络接口

ip link:查看网络接口的数据链路层信息

ip address:查看网络接口的网络层信息

ethtool eth0:查看网络接口的速率，模式等

3. 使用route命令查看路由表条目

查看从本机向其他主机，其他网络发送数据的去向，是排除网络故障的关键信息

```bash
目标            网关            子网掩码        标志  跃点   引用  使用 接口
0.0.0.0         192.168.1.1     0.0.0.0         UG    100    0        0 enp2s0
169.254.0.0     0.0.0.0         255.255.0.0     U     1000   0        0 enp2s0
172.16.0.0      0.0.0.0         255.255.0.0     U     0      0        0 br-d17ea1b6c8d0
172.17.0.0      0.0.0.0         255.255.0.0     U     0      0        0 docker0
172.18.0.0      0.0.0.0         255.255.0.0     U     0      0        0 br-8c5e7d7bf138
172.19.0.0      0.0.0.0         255.255.0.0     U     0      0        0 br-7148c3e58a27
192.168.1.0     0.0.0.0         255.255.255.0   U     100    0        0 enp2s0
192.168.123.0   0.0.0.0         255.255.255.0   U     0      0        0 br-2491a1309887
route
default         RAISECOM.domain 0.0.0.0         UG    100    0        0 enp2s0
link-local      0.0.0.0         255.255.0.0     U     1000   0        0 enp2s0
172.16.0.0      0.0.0.0         255.255.0.0     U     0      0        0 br-d17ea1b6c8d0
172.17.0.0      0.0.0.0         255.255.0.0     U     0      0        0 docker0
172.18.0.0      0.0.0.0         255.255.0.0     U     0      0        0 br-8c5e7d7bf138
172.19.0.0      0.0.0.0         255.255.0.0     U     0      0        0 br-7148c3e58a27
192.168.1.0     0.0.0.0         255.255.255.0   U     100    0        0 enp2s0
192.168.123.0   0.0.0.0         255.255.255.0   U     0      0        0 br-2491a1309887

route -n
```

Destination：对应目标网段地址

Gateway:下一跳路由器地址

4. 使用netstat查看网络连接情况

通过netstat查看网络接口状态，路由表，接口统计等信息

-a:显示所有活动的网络连接信息

-n:以数字的形式显示相关

-r:显示路由表信息

-l:显示处于监听状态的网络连接以及端口信息

-t:查看TCP协议相关信息

-u:显示UDP协议相关信息

-p:显示与网络连接相关的进程号，进程名称信息

#### 测试网络连接

1. 使用ping命令测试网络连通性
2. 使用traceroute命令测试从当前主机到目的主机之间经过的结点，显示中间节点的连接状态
3. 使用nslookup命令测试DNS域名解析

#### 设置网络地址参数

* 临时配置：通过命令行直接修改当前正在使用的网络地址，修改后立即生效，重启network服务或重启主机后会失效
* 固定配置：通过配置文件来存放固定的各种网络地址，需要重启network服务或重启主机后才会生效

1. 使用ifconfig命令修改网卡地址，状态
   ifconfig命令不仅可以修改网卡的ip，子网掩码，也可以绑定虚拟网络接口，激活或停用网络接口
   修改网卡ip地址，子网掩码
2. `ifconfig 网络接口名称 IP地址 [netmask 子网掩码]`
3. `ifconfig 网络接口名称 IP地址 [/ 子网掩码长度 ]`
4. 禁用,激活网络接口
5. `ifconfig eth1 down/up`
   为网卡绑定虚拟接口
   `ifconfig 虚拟网卡名称 ip地址`
6. 使用route命令添加，删除静态路由记录
   `route add -net 192.168.3.0/24 gw 192.168.4.254`
   `route del -net 192.168.3.0/24`
7. 添加，删除默认网关记录
   `route del default gw 192.168.4.1`
   `route add default gw 192.168.4.1 `

#### 修改网络配置文件

1. 网络接口配置文件
   默认目录位于/etc/sysconfig/network-scripts,文件名为ifcfg-XXX,XXX是网络接口名称
2. 域名解析配置文件
   `vi /etc/resolv.conf`
3. 本地主机映射文件
   `vi /etc/hosts`
