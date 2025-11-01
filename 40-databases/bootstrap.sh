component=$1
dnf install ansible -y
ansible-pull -U https://github.com/daws-86s/ansible-roboshop-roles-tf.git component=$component main.yaml