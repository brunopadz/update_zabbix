#
# Zabbix Agent
#
zabbix-agent:
  pkg:
    - installed
  service.running:
    - enable: True
