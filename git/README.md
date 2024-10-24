# Configuration Steps


## Colored Terminal
To configure the terminal, we'll perform the following steps:

- Download the zipped file
- Move the directory udacity-terminal-config to your home directory and name it .udacity-terminal-config (there's a dot at the front, now!)
- move the bash_profile file to your home directory and name it .bash_profile (there's a dot at the front, now!)
- if you *already- have a .bash_profile file in your home directory, transfer the content from the downloaded bash_profile to your existing .bash_profile




## First Time Git Configuration

Before you can start using Git, you need to configure it. Run each of the following lines on the command line to make sure everything is set up.

```
# Sets up Git with your name
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
```


## SSH key configuration

```bash
## enter following command on the system
ssh-keygen -t rsa -b 4096 -C 'github'

## copy the file content
cat ~/.ssh/id_rsa.pub content\

## Copy the content to github
copy the key to github setting-->ssh keys

## Verify the connection to github
ssh -T git@github.com

## Check the remote url for the repository
git remote -v

## if you are using http replace the url with git
git remote set-url origin git-url

## Check the remote url Again
git remote get-url origin

```



# Habbits - Best Practice - Sequence

1. Check your current branch
```bash
git branch
```
2. Create a feature branch for each new feature
```bash
git checkout -b new_branch
git checkout branch_name
```

3. pull the latest changes / use rebase insted of 3 way marge
```bash
#checkout the branch 
git pull --rebase <remote-name> <branch-name>
```

4. Solving a conflit: Discuss with the project patner and then commit what is acceptable

5. Complete a fuction or bug and then commit
```bash
git diff 
git log --oneline
```

6. Write description properly when completed with feature 

7. In case of merging check how it can be done to keep single line project history: ff merge, no ff, 3 way, rebase
```bash
git diff 
git merge -- fast forward, no ff, or 3 way - solve conflits
git log
```
8. Use pull request to merge the changes




# Debugging

```bash
# Search for perticular string
git grep 'String'

# Find the metadata of all the commit in the file
git blame filename
git show <hash_id>

#Find you want to know which commit caused the bug
git bisect start
git bisect good <Working_hash_id>
git bisect bad <non_working_hash_id>
```




