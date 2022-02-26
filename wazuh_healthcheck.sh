#!/bin/sh
host=$(ip route get 8.8.8.8 | awk -F"src " 'NR==1{split($2,a," ");print a[1]}')

#Check wazuh-Authd processes
if [ -n "$(pgrep wazuh-authd)" ]; then
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-authd", "healthy":"yes"}'
echo -e "$json" >> /tmp/health.json
else
#Attempt a restart
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-authd", "healthy":"attempting_restart"}'
echo -e "$json" >> /tmp/health.json
service wazuh-manager restart
sleep 5
if [ -n "$(pgrep wazuh-authd)" ]; then
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-authd", "healthy":"yes"}'
echo -e "$json" >> /tmp/health.json
else
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-authd", "healthy":"no"}'
echo -e "$json" >> /tmp/health.json
fi
fi

#Check wazuh-db processes
if [ -n "$(pgrep wazuh-db)" ]; then
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-db", "healthy":"yes"}'
echo -e "$json" >> /tmp/health.json
else
#Attempt a restart
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-db", "healthy":"attempting_restart"}'
echo -e "$json" >> /tmp/health.json
service wazuh-manager restart
sleep 5
if [ -n "$(pgrep wazuh-db)" ]; then
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-db", "healthy":"yes"}'
echo -e "$json" >> /tmp/health.json
else
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-db", "healthy":"no"}'
echo -e "$json" >> /tmp/health.json
fi
fi

#Check wazuh-execd processes
if [ -n "$(pgrep wazuh-execd)" ]; then
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-execd", "healthy":"yes"}'
echo -e "$json" >> /tmp/health.json
else
#Attempt a restart
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-execd", "healthy":"attempting_restart"}'
echo -e "$json" >> /tmp/health.json
service wazuh-manager restart
sleep 5
if [ -n "$(pgrep wazuh-execd)" ]; then
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-execd", "healthy":"yes"}'
echo -e "$json" >> /tmp/health.json
else
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-execd", "healthy":"no"}'
echo -e "$json" >> /tmp/health.json
fi
fi

#Check wazuh-analysisd wazuhprocesses
if [ -n "$(pgrep wazuh-analysisd)" ]; then
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-analysisd", "healthy":"yes"}'
echo -e "$json" >> /tmp/health.json
else
#Attempt a restart
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-analysisd", "healthy":"attempting_restart"}'
echo -e "$json" >> /tmp/health.json
service wazuh-manager restart
sleep 5
if [ -n "$(pgrep wazuh-analysisd)" ]; then
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-analysisd", "healthy":"yes"}'
echo -e "$json" >> /tmp/health.json
else
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-analysisd", "healthy":"no"}'
echo -e "$json" >> /tmp/health.json
fi
fi

#Check wazuh-syscheckd wazuhprocesses
if [ -n "$(pgrep wazuh-syscheckd)" ]; then
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-syscheckd", "healthy":"yes"}'
echo -e "$json" >> /tmp/health.json
else
#Attempt a restart
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-syscheckd", "healthy":"attempting_restart"}'
echo -e "$json" >> /tmp/health.json
service wazuh-manager restart
sleep 5
if [ -n "$(pgrep wazuh-syscheckd)" ]; then
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-syscheckd", "healthy":"yes"}'
echo -e "$json" >> /tmp/health.json
else
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-syscheckd", "healthy":"no"}'
echo -e "$json" >> /tmp/health.json
fi
fi

#Check ossec-remoted wazuhprocesses
if [ -n "$(pgrep ossec-remoted)" ]; then
json='{"host":"'"$host"'", "wazuhprocess":"ossec-remoted", "healthy":"yes"}'
echo -e "$json" >> /tmp/health.json
else
#Attempt a restart
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-remoted", "healthy":"attempting_restart"}'
echo -e "$json" >> /tmp/health.json
service wazuh-manager restart
sleep 5
if [ -n "$(pgrep wazuh-remoted)" ]; then
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-remoted", "healthy":"yes"}'
echo -e "$json" >> /tmp/health.json
else
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-remoted", "healthy":"no"}'
echo -e "$json" >> /tmp/health.json
fi
fi

#Check wazuh-logcollector wazuhprocesses
if [ -n "$(ps -ef | grep wazuh-logcollector | grep -v grep | awk '{print $2}')" ]; then
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-logcollector", "healthy":"yes"}'
echo -e "$json" >> /tmp/health.json
else
#Attempt a restart
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-logcollector", "healthy":"attempting_restart"}'
echo -e "$json" >> /tmp/health.json
service wazuh-manager restart
sleep 5
if [ -n "$(ps -ef | grep wazuh-logcollector | grep -v grep | awk '{print $2}')" ]; then
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-logcollector", "healthy":"yes"}'
echo -e "$json" >> /tmp/health.json
else
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-logcollector", "healthy":"no"}'
echo -e "$json" >> /tmp/health.json
fi
fi

#Check wazuh-monitord wazuhprocesses
if [ -n "$(pgrep wazuh-monitord)" ]; then
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-monitord", "healthy":"yes"}'
echo -e "$json" >> /tmp/health.json
else
#Attempt a restart
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-monitord", "healthy":"attempting_restart"}'
echo -e "$json" >> /tmp/health.json
service wazuh-manager restart
sleep 5
if [ -n "$(pgrep wazuh-monitord)" ]; then
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-monitord", "healthy":"yes"}'
echo -e "$json" >> /tmp/health.json
else
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-monitord", "healthy":"no"}'
echo -e "$json" >> /tmp/health.json
fi
fi

#Check wazuh-modulesd wazuhprocesses
if [ -n "$(pgrep wazuh-modulesd)" ]; then
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-modulesd", "healthy":"yes"}'
echo -e "$json" >> /tmp/health.json
else
#Attempt a restart
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-modulesd", "healthy":"attempting_restart"}'
echo -e "$json" >> /tmp/health.json
service wazuh-manager restart
sleep 5
if [ -n "$(pgrep wazuh-modulesd)" ]; then
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-modulesd", "healthy":"yes"}'
echo -e "$json" >> /tmp/health.json
else
json='{"host":"'"$host"'", "wazuhprocess":"wazuh-modulesd", "healthy":"no"}'
echo -e "$json" >> /tmp/health.json
fi
fi
