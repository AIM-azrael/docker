#查看网桥上的虚拟网卡与容器端是如何对应的？
#通过ifindex,网卡索引号
#查看test1容器的网卡索引
    docker exec -ti test1 cat /sys/class/net/eth0/ifindex
#主机中找到虚拟网卡后面的@ifxx的值，如果是同一个值，说明虚拟网卡与容器eth0网卡是配对的
    ip a | grep @if

#快速查看脚本
for container in $(docker ps -q); do
    iflink= docker exec -it $container sh -c 'cat /sys/class/net/eth0/iflink'
    iflink= echo $iflink|tr -d '\r'
    veth= grep -l $iflink /sys/class/net/veth*/iflink
    veth= echo $veth|sed -e 's;^.*net/\(.*\)/ifindex$;\1;'
    echo $container:$veth
done