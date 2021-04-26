##≈‰÷√‘¥º”ÀŸ
## https://cr. console. aliyun. com/cn-hangzhou/instances/mi rrors
mkdir -p /etc/docker 
vi /etc/docker/ daemon. json
{
"registry-mi rrors" : [
"https ://8xpk 5wnt . mi rror. aliyuncs. com" ,
"https: //dockerhub . azk8s.cn",
"https: //registry. docker-cn. com" ,
"https: //ot2k4d59. mi rror. aliyuncs . com/"
]
}
