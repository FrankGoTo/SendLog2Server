#!/bin/bash

# school network login
# curl -s http://10.3.8.211/login --data "user=[user]&pass=[pswd]&line="
# curl -G 10.3.8.211/logout

des_pass=[remote server passwd]
ifconfig > `date +%y%m%d%H%M%S`
expect -c "
spawn scp `date +%y%m%d%H%M%S` root@[remote server ip]:[remote path]
expect \"password:\"
send \"${des_pass}\r\"
expect eof
"
