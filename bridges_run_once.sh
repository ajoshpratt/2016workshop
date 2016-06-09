ssh-keygen || echo "Didn't work!" && exit 1
cat ~/.ssh/id_rsa.pub > ~/.ssh/authorized_keys  || echo "Didn't work!" && exit 1
echo "Completed!"
