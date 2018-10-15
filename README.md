# frp内网穿透客户端

## 如何使用

> 先确保外网的frps已经弄好，否则前往[这里](https://github.com/caidewu/frps)查看frps安装过程

### 在内网服务器clone本项目

```
git clone https://github.com/caidewu/frpc.git
```

### 修改frpc.ini配置

当外网frps服务安装好后会生成如下配置

```
============== Check your input ==============
You Server IP      : 100.100.100.100
Bind port          : 7000
kcp support        : true
vhost http port    : 10080
vhost https port   : 10443
Dashboard port     : 7500
Dashboard user     : admin
Dashboard password : xxxxxx
token              : xxxxxxxx
tcp_mux            : true
Max Pool count     : 50
Log level          : info
Log max days       : 3
Log file           : enable
==============================================

```

frpc.ini中与frps相关的配置对应关系如下

```
server_addr = You Server IP
server_port = Bind port 
privilege_token = token

```

穿透配置说明

```
[ssh-0-220] 这里配置的是服务器ssh登陆
type = tcp ssh登陆协议本身依赖的协议也是tcp协议
local_ip = 127.0.0.1
local_port = 22 本地ssh的端口就是22，这个没什么好说的
remote_port = 7220 映射到外网服务器上的端口
```

使用如下:

```
ssh -p 7220 abc@100.100.100.100
```

**需要注意的是**: abc这个用户是内网服务器的用户，`100.100.100.100`这个是外网服务器的地址，因为内网服务器的22端口已经被frp服务映射在7220端口上了，所以ssh访问外网服务器的7220端口就等于是访问内网的22端口

具体配置参考[frp文档](https://github.com/fatedier/frp/blob/master/README_zh.md)

### 启动frpc服务

```
./startup.sh
```


## 相关项目

- [服务端自动运行脚本](https://github.com/caidewu/frps)
