# Configuration Steps


## First Time Git Configuration

Before you can start using Ansible, you need to configure it. Run each of the following lines on the command line to make sure everything is set up.

#### Install ansible on the controller node
```bash
apt install ansible
```

#### Setup the virtual machine or machines (managed nodes)
You can setup in cloud or virtualmachine using virtualization.


#### Configure the following

```
# Step 1: Create ansadmin user across all servers
useradd -s /bin/bash -m -d /home/ansadmin ansadmin

# Step 2: Provide the root access for this ansadmin user on all servers
vim /etc/sudoers
# Add the following line
ansadmin ALL=(ALL) NOPASSWD: ALL

# Step 3: Generate SSH Keys on Ansible Controller node from ansadmin user and exchange them with managed nodes with the same ansadmin user

ssh-keygen -t rsa -b 4096 -C 'ansadmin'

ssh-copy-id ansadmin@managednodes.example.com

# Step 4: Login into ansible controller node and switch to ansadmin user and Create a directory for your project, let say /home/ansadmin/myproject
mkdir -p /home/ansadmin/ansible

echo "ip-host" >> hosts

# Step 5 : Verify connectivity from your ansible controller node to ansible managed nodes using
ansible all -m ping -i ./hosts
ansible all -m ansible.builtin.ping


