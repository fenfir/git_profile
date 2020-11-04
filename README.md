# git_profile

## Adding to your prompt

Source the git_profile.sh file in your .bashrc

```
source <path-to-repo>/git_profile.sh
```

Then you can add it to your prompt by including `$(git_profile)` in your PS1

```
PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w $(git_profile) \$ '
```