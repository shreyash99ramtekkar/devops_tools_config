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

```bash
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
```

### Setup

```bash
# clone the repository
git clone https://github.com/shreyash99ramtekkar/devops_tools_config.git

# Copy the ansible folder into the directory you want to work in

cp -r ./devops_tools_config/ansible/ansible /home/${USER}

# Setup the configr as per your need

vim /home/${USER}/ansible/ansible.cfg

# Start working


```



### Authentication using username and password

```bash
# Edit the file
vim /etc/sshd/sshd_config

#Search for the string PasswordAuthentication and change its value to yes

PasswordAuthentication yes

# Restart the service

sudo systemctl restart sshd

# Test using password from controller
ansible all -m ping --user ansadmin -k

# In case it ask to install the sshpass 
apt-get install sshpass


```


### Custom facts - can be used to keep track of application version
```bash

# Create a facts directory on the manged nodes
ansible all -m file -a 'path=/etc/ansible/facts.d state=directory' -b

# Copy the fact file to the managed nodes
ansible all -m copy -a 'src=java.fact dest=/etc/ansible/facts.d/java.fact mode=0755' -b

# Check the facts
ansible all -m setup -a 'filter=ansible_local'




```


### Good Habbits

```bash
# Check which configration file its using
ansible --version


# check on which server the playbook is going to run
ansible <group-name> --list 

# Dry run the command


```

