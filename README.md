## 1、 Harbor Installation Prerequisites

- 主机名设置：`~]# hostnamectl  set-hostname reg.linux.io`

- 关闭防火墙：`~]# for i in stop disable ;do sudo systemctl $i firewalld; done`
- 关闭selinux：`~]# setenforce 0 && sudo sed -i "s/^SELINUX=enforcing/SELINUX=disabled/g" /etc/selinux/config`
- 时间同步：`*/3 * * * * /usr/sbin/ntpdate ntp.aliyun.com > /dev/null`

- 开启内核转发

```
~]# cat > /etc/sysctl.d/99-kubernetes-cri.conf <<EOF
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF
~]# sysctl  --system
```

## 2、Install docker

```
~]# yum install -y yum-utils device-mapper-persistent-data lvm2
~]# yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
~]# yum install -y  docker-ce-19.03.8
```

```
~]# mkdir /etc/docker
~]# mkdir -pv /opt/docker-root
~]# vim /etc/docker/daemon.json
{
        "registry-mirrors": ["https://o4uba187.mirror.aliyuncs.com"],
        "graph":  "/opt/docker-root"
}
 ~]# for i in enable restart; do systemctl restart docker ;done
```

## Download the Harbor Installer

- [Download and Unpack the Installer](https://github.com/goharbor/harbor/releases)

```
 ~]# wget https://github.com/goharbor/harbor/releases/download/v1.10.1/harbor-online-installer-v1.10.1.tgz
 ~]# tar -xf harbor-online-installer-v1.10.1.tgz  -C /opt/
```

- Install docker-compose

```
 ~]# yum install -y python3-pip
 ~]# pip3 install docker-compose -i https://pypi.douban.com/simple
```

- [Configure HTTPS Access to Harbor](https://goharbor.io/docs/1.10/install-config/configure-https/)

```
~]# mkdir /opt/harbor/ssl
~]# cd /opt/harbor/ssl
```

```
1. Generate a CA certificate private key.
ssl]# openssl genrsa -out ca.key 4096
```

```
2. Generate the CA certificate.
ssl]# openssl req -x509 -new -nodes -sha512 -days 3650 \
 -subj "/C=CN/ST=Beijing/L=Beijing/O=example/OU=Personal/CN=reg.linux.io" \
 -key ca.key \
 -out ca.crt
```

```
3. Generate a private key for harbor server.
ssl]# openssl genrsa -out reg.linux.io.key 4096
```

```
4. Generate a certificate signing request (CSR).
ssl]# openssl req -sha512 -new \
    -subj "/C=CN/ST=Beijing/L=Beijing/O=example/OU=Personal/CN=reg.linux.io" \
    -key reg.linux.io.key \
    -out reg.linux.io.csr
```

```
5. Generate an x509 v3 extension file.
ssl]# cat > v3.ext <<-EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names

[alt_names]
DNS.1=reg.linux.io
DNS.2=reg.linux.io
DNS.3=192.168.124.250
EOF
```

```
6. Use the v3.ext file to generate a certificate for your Harbor host.
ssl]# openssl x509 -req -sha512 -days 3650 \
    -extfile v3.ext \
    -CA ca.crt -CAkey ca.key -CAcreateserial \
    -in reg.linux.io.csr \
    -out reg.linux.io.crt
```

- Configure the Harbor YML File

```
 ~]# vim /opt/harbor/harbor.yml
 hostname: reg.linux.io

 # http related config
 http:
   # port for http, default is 80. If https enabled, this port will redirect to https port
   port: 80

 # https related config
 https:
   # https port for harbor, default is 443
   port: 443
   # The path of cert and key files for nginx
   certificate: /opt/harbor/ssl/reg.linux.io.crt
   private_key: /opt/harbor/ssl/reg.linux.io.key
```

- Run the `prepare` script to enable HTTPS

```
~]# cd /opt/harbor/ && ./prepare
~]# cd /opt/harbor/ && ./install.sh
```

```
1. stop harbor image data remains in the file system, so no data is lost.
~]# docker-compose down -v
2. Restart Harbor: docker-compose up -d
```

## Provide the Certificates to Harbor and Docker

- Convert `reg.linux.crt` to `reg.linux.io.cert`, for use by Docker.

```
ssl]# openssl x509 -inform PEM -in reg.linux.io.crt -out reg.linux.io.cert
```



- Copy the server certificate, key and CA files into the Docker certificates folder on the Harbor host.

```
ssl]# mkdir -pv  /etc/docker/certs.d/reg.linux.io/
ssl]# cp reg.linux.io.cert  /etc/docker/certs.d/reg.linux.io/
ssl]# cp reg.linux.io.key  /etc/docker/certs.d/reg.linux.io/
ssl]# cp ca.crt  /etc/docker/certs.d/reg.linux.io/
```

```
~]# docker login reg.linux.io -u admin -p Harbor12345
```

## Upload image to Harbor

```
~]# docker tag ikubernetes/myapp:v1  reg.linux.io/library/myapp:v1
~]# docker push reg.linux.io/library/myapp:v1
```
