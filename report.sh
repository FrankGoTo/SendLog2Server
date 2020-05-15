#!/bin/bash

# school network login
# curl -s http://10.3.8.211/login --data "user=[user]&pass=[pswd]&line="
# curl -G 10.3.8.211/logout

# file name
FILE=[local path]
DATE=`date +%yy%mm%dd%HH%MM%SS`
NEWFILE=${FILE}_${DATE}
echo $NEWFILE

des_pass=[remote server passwd]
ifconfig > $NEWFILE
expect -c "
spawn scp $NEWFILE root@[remote server ip]:[remote path]
expect \"password:\"
send \"${des_pass}\r\"
expect eof
"
