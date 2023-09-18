#!/bin/bash
#add fix to exercise5-server2 here
#!/bin/bash
#add fix to exercise5-server2 here
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
#service sshd restart


echo "PermitRootLogin yes" | sudo tee -a /etc/ssh/sshd_config
service ssh restart
