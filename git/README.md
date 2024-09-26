Configuration Steps --colors

To configure the terminal, we'll perform the following steps:

download the zipped file
move the directory udacity-terminal-config to your home directory and name it .udacity-terminal-config (there's a dot at the front, now!)
move the bash_profile file to your home directory and name it .bash_profile (there's a dot at the front, now!)
if you *already- have a .bash_profile file in your home directory, transfer the content from the downloaded bash_profile to your existing .bash_profile




First Time Git Configuration

Before you can start using Git, you need to configure it. Run each of the following lines on the command line to make sure everything is set up.

# sets up Git with your name
git config --global user.name "<Your-Full-Name>"

# sets up Git with your email
git config --global user.email "<your-email-address>"

# makes sure that Git output is colored
git config --global color.ui auto

# displays the original state in a conflict
git config --global merge.conflictstyle diff3

git config --list

# if you want to change the editor for git
git config --global core.editor "subl -n -w"
