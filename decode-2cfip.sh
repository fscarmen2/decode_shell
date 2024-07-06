#!/bin/bash
export LANG=en_US.UTF-8
os_type=$(uname)
os_arch=$(uname -m)
if [ "$os_type" == "Darwin" ]; then
	if [ "$os_arch" == "x86_64" ] || [ "$os_arch" == "i386" ]; then
		cpu="amd64a"
	elif [ "$os_arch" == "arm64" ]; then
		cpu="arm64a"
	fi
else
	case "$(uname -m)" in
	x86_64 | x64 | amd64)
		cpu=amd64
		;;
	i386 | i686)
		cpu=386
		;;
	armv8 | armv8l | arm64 | aarch64)
		cpu=arm64
		;;
	armv7l)
		cpu=arm
		;;
	*)
		echo "当前架构为$(uname -m)，暂不支持"
		exit
		;;
	esac
fi

speedtestrul() {
	echo "是否使用其他测速地址？（可直接输入其他测速地址 【 注意，不要带http(s):// 】 ，回车使用默认测速地址）"
	read -p "请输入: " menu
	if [ -z $menu ]; then
		URL="t2.geigei.gq"
	else
		URL="$menu"
	fi
}

gfip() {
	if [ ! -f cfcdnip ]; then
		curl -L -o cfcdnip -# --retry 2 https://gitlab.com/rwkgyg/CFwarp/-/raw/main/point/cpu4/$cpu
		chmod +x cfcdnip
	fi
	echo "1、优选CF官方IPV4"
	echo "2、优选CF官方IPV6 (本地网络须支持IPV6)"
	read -p "请选择：" point
	if [ "$point" = "1" ]; then
		curl -s -O https://gitlab.com/rwkgyg/CFwarp/-/raw/main/point/cpu3/ip.txt
	elif [ "$point" = "2" ]; then
		curl -s -o ip.txt https://gitlab.com/rwkgyg/CFwarp/-/raw/main/point/cpu3/ipv6.txt
	else
		echo "输入有误，请重新选择" && gfip
	fi
	echo "虽然官方IP的13个端口通用，但请选择一个最经常使用的端口作为测试依据"
	echo "开启tls的端口：443、8443、2053、2083、2087、2096"
	echo "关闭tls的端口：80、8080、8880、2052、2082、2086、2095"
	read -p "请选择以上13个端口之一：" point
	if ! [[ "$point" =~ ^(2052|2082|2086|2095|80|8880|8080|2053|2083|2087|2096|8443|443)$ ]]; then
		echo "输入的端口为$opint，输入错误" && cfpoint
	fi
	if [ "$cpu" = arm64 ] || [ "$cpu" = arm ]; then
		echo "是否测速？（选择 1 测速，回车默认不测速）"
		read -p "请选择: " menu
		if [ -z $menu ]; then
			./cfcdnip -tp $point -dd -tl 250
		elif [ "$menu" == "1" ]; then
			speedtestrul
			[[ $point =~ 2053|2083|2087|2096|8443|443 ]] && htp=https || htp=http
			./cfcdnip -tp $point -url $htp://$URL -sl 2 -tl 250 -dn 5
		else
			exit
		fi
	elif [ "$cpu" = 386 ]; then
		echo "是否测速？（选择 1 测速，回车默认不测速）"
		read -p "请选择: " menu
		if [ -z $menu ]; then
			./cfcdnip -tp $point -dd -tl 250
		elif [ "$menu" == "1" ]; then
			speedtestrul
			[[ $point =~ 2053|2083|2087|2096|8443|443 ]] && htp=https || htp=http
			./cfcdnip -tp $point -url $htp://$URL -sl 2 -tl 250 -dn 5
		else
			exit
		fi
	else
		echo "是否测速？（选择 1 测速，回车默认不测速）"
		read -p "请选择: " menu
		if [ -z $menu ]; then
			./cfcdnip -tp $point -dd -tl 250
		elif [ "$menu" == "1" ]; then
			speedtestrul
			[[ $point =~ 2053|2083|2087|2096|8443|443 ]] && htp=https || htp=http
			./cfcdnip -tp $point -url $htp://$URL -sl 2 -tl 250 -dn 5
		else
			exit
		fi
	fi
}

fdip() {
	if [ ! -f cfcdnip ]; then
		curl -L -o cfcdnip -# --retry 2 https://gitlab.com/rwkgyg/CFwarp/-/raw/main/point/cpu2/$cpu
		chmod +x cfcdnip
		curl -sSLO https://mirror.ghproxy.com/https://raw.githubusercontent.com/yonggekkk/Cloudflare-workers-pages-vless/main/locations.json
	fi
	echo "下载更新反代IP库txt.zip文件……"
	wget -q https://zip.baipiao.eu.org -O txt.zip
	if [ $? -eq 0 ]; then
		echo "下载成功"
	else
		curl -L -# --retry 2 https://cf.yg-kkk.gq -o txt.zip
		if [ $? -eq 0 ]; then
			echo "下载成功"
		else
			echo "下载失败，继续使用之前的反代IP库"
		fi
	fi
	rm -rf txt
	unzip -o txt.zip -d txt >/dev/null 2>&1
	if [[ ! -e "txt" ]]; then
		echo "反代IP库txt.zip文件下载失败，请重置清理再次运行" && exit
	fi
	echo "开启tls的端口：443、8443、2053、2083、2087、2096"
	echo "关闭tls的端口：80、8080、8880、2052、2082、2086、2095"
	read -p "请选择以上13个端口之一：" point
	if ! [[ "$point" =~ ^(2052|2082|2086|2095|80|8880|8080|2053|2083|2087|2096|8443|443)$ ]]; then
		echo "输入的端口为$opint，输入错误" && cfpoint
	fi
	if [ "$point" == "443" ]; then
		find txt -type f -name "*443*" ! -name "*8443*" -exec cat {} \; >ip.txt
	else
		find txt -type f -name "*${point}*" -exec cat {} \; >ip.txt
	fi
	if [ "$cpu" = arm64 ] || [ "$cpu" = arm ]; then
		grep -E '^8|^47|^43|^130|^132|^152|^193|^140|^138|^150|^143|^141|^155|^168|^124|^170|^119' ip.txt | awk '/^124/ { if (++count <= 20) print } /^170/ { if (++count <= 20) print } /^119/ { if (++count <= 20) print } /^8/ { if (++count <= 20) print } /^47/ { if (++count2 <= 20) print } /^43/ { if (++count3 <= 20) print } /^130/ { if (++count4 <= 20) print } /^132/ { if (++count5 <= 20) print } /^152/ { if (++count6 <= 20) print } /^193/ { if (++count7 <= 20) print } /^140/ { if (++count8 <= 20) print } /^138/ { if (++count9 <= 20) print } /^150/ { if (++count10 <= 20) print } /^143/ { if (++count11 <= 20) print } /^141/ { if (++count12 <= 20) print } /^155/ { if (++count13 <= 20) print } /^168/ { if (++count14 <= 20) print }' >pass.txt && mv pass.txt ip.txt
		#grep -E '^8|^47|^43|^130|^132|^152|^193|^140|^138|^150|^143|^141|^155|^168|^124|^170|^119' ip.txt > pass.txt && mv pass.txt ip.txt
		echo "是否测速？（选择 1 测速，回车默认不测速）"
		read -p "请选择: " menu
		if [ -z $menu ]; then
			./cfcdnip -tp $point -dd -tl 250
		elif [ "$menu" == "1" ]; then
			speedtestrul
			[[ $point =~ 2053|2083|2087|2096|8443|443 ]] && htp=https || htp=http
			./cfcdnip -tp $point -url $htp://$URL -sl 2 -tl 250 -dn 5
		else
			exit
		fi
		ipcdn1
	elif [ "$cpu" = 386 ]; then
		#sed "s/$/ ${point}/" ip.txt > passip.txt && mv passip.txt ip.txt
		grep -E '^8|^47|^43|^130|^132|^152|^193|^140|^138|^150|^143|^141|^155|^168|^124|^170|^119' ip.txt | awk '/^124/ { if (++count <= 10) print } /^170/ { if (++count <= 10) print } /^119/ { if (++count <= 10) print } /^8/ { if (++count <= 10) print } /^47/ { if (++count2 <= 10) print } /^43/ { if (++count3 <= 10) print } /^130/ { if (++count4 <= 10) print } /^132/ { if (++count5 <= 10) print } /^152/ { if (++count6 <= 10) print } /^193/ { if (++count7 <= 10) print } /^140/ { if (++count8 <= 10) print } /^138/ { if (++count9 <= 10) print } /^150/ { if (++count10 <= 10) print } /^143/ { if (++count11 <= 10) print } /^141/ { if (++count12 <= 10) print } /^155/ { if (++count13 <= 10) print } /^168/ { if (++count14 <= 10) print }' >pass.txt && mv pass.txt ip.txt
		#grep -E '^8|^47|^43|^130|^132|^152|^193|^140|^138|^150|^143|^141|^155|^168|^124|^170|^119' ip.txt > pass.txt && mv pass.txt ip.txt
		echo "是否测速？（选择 1 测速，回车默认不测速）"
		read -p "请选择: " menu
		[[ $point =~ 2053|2083|2087|2096|8443|443 ]] && tls=true || tls=false
		if [ -z $menu ]; then
			./cfcdnip -tls=$tls -speedtest=0 -max=2 -port=$point
		elif [ "$menu" == "1" ]; then
			speedtestrul
			./cfcdnip -tls=$tls -speedtest=1 -max=2 -port=$point -url=$URL
		else
			exit
		fi
		ipcdn2
	else
		#sed "s/$/ ${point}/" ip.txt > passip.txt && mv passip.txt ip.txt
		grep -E '^8|^47|^43|^130|^132|^152|^193|^140|^138|^150|^143|^141|^155|^168|^124|^170|^119' ip.txt | awk '/^124/ { if (++count <= 40) print } /^170/ { if (++count <= 40) print } /^119/ { if (++count <= 40) print } /^8/ { if (++count <= 40) print } /^47/ { if (++count2 <= 40) print } /^43/ { if (++count3 <= 40) print } /^130/ { if (++count4 <= 40) print } /^132/ { if (++count5 <= 40) print } /^152/ { if (++count6 <= 40) print } /^193/ { if (++count7 <= 40) print } /^140/ { if (++count8 <= 40) print } /^138/ { if (++count9 <= 40) print } /^150/ { if (++count10 <= 40) print } /^143/ { if (++count11 <= 40) print } /^141/ { if (++count12 <= 40) print } /^155/ { if (++count13 <= 40) print } /^168/ { if (++count14 <= 40) print }' >pass.txt && mv pass.txt ip.txt
		#grep -E '^8|^47|^43|^130|^132|^152|^193|^140|^138|^150|^143|^141|^155|^168|^124|^170|^119' ip.txt > pass.txt && mv pass.txt ip.txt
		echo "是否测速？（选择 1 测速，回车默认不测速）"
		read -p "请选择: " menu
		[[ $point =~ 2053|2083|2087|2096|8443|443 ]] && tls=true || tls=false
		if [ -z $menu ]; then
			./cfcdnip -tls=$tls -speedtest=0 -max=60 -port=$point
		elif [ "$menu" == "1" ]; then
			speedtestrul
			./cfcdnip -tls=$tls -max=60 -port=$point -url=$URL
		else
			exit
		fi
		ipcdn2
	fi
}

ipcdn1() {
	echo
	echo "稍等1分钟，对优选反代IP进行地区识别，并做排名"
	rm -rf cdnIP.csv b.csv a.csv
	awk -F ',' 'NR>1 && NR<=101 {print $1}' result.csv >a.csv
	while IFS= read -r ip_address; do
		UA_Browser="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36"
		response=$(curl -s --user-agent "${UA_Browser}" "https://api.ip.sb/geoip/$ip_address" -k | awk -F "country_code" '{print $2}' | awk -F'":"|","|"' '{print $2}')
		if [ $? -eq 0 ]; then
			echo "IP地址 $ip_address 的地区是: $response" | tee -a b.csv
		else
			echo "无法获取IP地址 $ip_address 的地区信息" | tee -a b.csv
		fi
		sleep 1
	done <"a.csv"
	grep 'SG' b.csv | head -n 3 >>cdnIP.csv
	grep 'HK' b.csv | head -n 3 >>cdnIP.csv
	grep 'JP' b.csv | head -n 3 >>cdnIP.csv
	grep 'KR' b.csv | head -n 3 >>cdnIP.csv
	grep 'TW' b.csv | head -n 3 >>cdnIP.csv
	grep 'US' b.csv | head -n 3 >>cdnIP.csv
	grep 'GB' b.csv | head -n 3 >>cdnIP.csv
	grep 'DE' b.csv | head -n 3 >>cdnIP.csv
	grep 'NL' b.csv | head -n 3 >>cdnIP.csv
	grep 'FR' b.csv | head -n 3 >>cdnIP.csv
	echo
	echo "根据每个地区，排名前三的优选IP如下："
	cat cdnIP.csv
}

ipcdn2() {
	rm -rf cdnIP.csv
	{
		grep 'HKG' ip.csv | head -n 3
		echo
		grep 'NRT' ip.csv | head -n 3
		echo
		grep 'KIX' ip.csv | head -n 3
		echo
		grep 'SIN' ip.csv | head -n 3
		echo
		grep 'ICN' ip.csv | head -n 3
		echo
		grep 'FRA' ip.csv | head -n 3
		echo
		grep 'LHR' ip.csv | head -n 3
		echo
		grep 'SJC' ip.csv | head -n 3
		echo
	} >>cdnIP.csv
	echo
	echo "根据每个地区，排名前三的优选IP如下："
	cat cdnIP.csv
}

rmrf() {
	rm -rf txt txt.zip ip.txt ipv6.txt cfcdnip result.csv cdnIP.csv a.csv b.csv ip.csv
}

echo "------------------------------------------------------"
echo "甬哥Github项目  ：github.com/yonggekkk"
echo "甬哥Blogger博客 ：ygkkk.blogspot.com"
echo "甬哥YouTube频道 ：www.youtube.com/@ygkkk"
echo "------------------------------------------------------"
echo "CF优选IP二合一脚本（官方IP与反代IP）  V2024.4.4"
echo "------------------------------------------------------"
echo
echo "1. 优选CF官方IP"
echo "2. 优选CF反代IP"
echo "0. 退出"
read -p "请选择: " menu
if [ "$menu" == "1" ]; then
	rmrf && gfip
elif [ "$menu" == "2" ]; then
	rmrf && fdip
else
	exit
fi
