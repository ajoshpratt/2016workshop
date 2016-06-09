#! /bin/bash -l

ssh-keygen
cat ~/.ssh/id_rsa.pub > ~/.ssh/authorized_keys
echo "Completed!"
