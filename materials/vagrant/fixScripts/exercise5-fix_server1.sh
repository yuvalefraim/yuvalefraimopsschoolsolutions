#!/bin/bash
#add fix to exercise5-server1 here
#!/bin/bash

#Install sshpass
if ! command -v sshpass &> /dev/null; then
            echo "sshpass not found. Installing sshpass"
                sudo apt install -y sshpass
fi

#Create t.txt and insert "vagrant"
echo "vagrant" > t.txt
#Generate SSH key pair (without passphrase)
#The "-N ''" specifies an empty passphrase.
sudo -u vagrant ssh-keygen -t rsa -N '' -f /home/vagrant/.ssh/id_rsa
#sudo -u vagrant ssh-keygen -t rsa -N '' -f /home/vagrant/.ssh/id_rsa -y
#Use sshpass to copy the public key
sudo -u vagrant sshpass -p'vagrant' ssh-copy-id vagrant@server2

#Remove t.txt after use for security reasons
rm t.txt

