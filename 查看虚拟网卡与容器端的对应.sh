#�鿴�����ϵ���������������������ζ�Ӧ�ģ�
#ͨ��ifindex,����������
#�鿴test1��������������
    docker exec -ti test1 cat /sys/class/net/eth0/ifindex
#�������ҵ��������������@ifxx��ֵ�������ͬһ��ֵ��˵����������������eth0��������Ե�
    ip a | grep @if

#���ٲ鿴�ű�
for container in $(docker ps -q); do
    iflink= docker exec -it $container sh -c 'cat /sys/class/net/eth0/iflink'
    iflink= echo $iflink|tr -d '\r'
    veth= grep -l $iflink /sys/class/net/veth*/iflink
    veth= echo $veth|sed -e 's;^.*net/\(.*\)/ifindex$;\1;'
    echo $container:$veth
done