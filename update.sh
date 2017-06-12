#!/bin/sh
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'
function UpdateZabbix6(){
        sudo service zabbix-agent stop
        sudo rpm -Uvh http://webserver/repository/zabbix-agent-xxxxxx.el6.x86_64.rpm
        sudo service zabbix-agent start
}
function UpdateZabbix7(){
        sudo systemctl stop zabbix-agent
        sudo rpm -Uvh http://webserver/repository/zabbix-agent-xxxxxxx.el7.x86_64.rpm
        sudo systemctl start zabbix-agent
}
echo -e "${RED}Checking OS version...\n"; sleep 2
if grep -q -i "release 6" /etc/redhat-release; then
        echo -e "Updating Zabbix Agent for RHEL/CentOS ${BLUE}6.x${NC}\n"
                sleep 1
        UpdateZabbix6
else
        echo -e "Updating Zabbix Agent for RHEL/CentOS ${BLUE}7.x${NC}\n"
                sleep 1
        UpdateZabbix7
fi
