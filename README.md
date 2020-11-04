# git_profile
## Create a config file (~/.gitprofiles.yaml)

```
profiles:
  - name: profile1
    user: John Doe
    email: john.doe@example.com
    sshCommand: ssh -i ~/.ssh/id_rsa_profile1
  - name: profile2
    user: Max Musterman
    email: max.musterman@example.com
    sshCommand: ssh -i ~/.ssh/id_rsa_profile2

```

## Setting the profiles
```
git_profile_set_global_profile profile1
```

```
git_profile_set_repo_profile profile1
```

## Adding to your prompt

Source the git_profile.sh file in your .bashrc

```
source <path-to-repo>/git_profile.sh
```

Then you can add it to your prompt by including `$(git_profile)` in your PS1

```
PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w $(git_profile) \$ '
```