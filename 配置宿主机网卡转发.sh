#��������������ת��
#��������ת�����鿴ֵ�Ƿ�Ϊ1
sysctl -a |grep -w net.ipv4.ip_forward

#��δ���ã���ִ��
cat <<EOF > /etc/sysctl.d/docker.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward=1
EOF
sysctl -p /etc/sysctl.d/docker.conf