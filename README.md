# dotfiles

[//]: # (This repository used to be hosted on codeberg at https://codeberg.org/kindredbluespirit/dotfiles.git. \
If you're on github, you're looking at a backup mirror which is sometimes not up to date.)

[//]: # (I frequently squash the commits to save memory and because I don't really
require git versioning for this repository.)

### system/root setup
Run `setup-arch-packages` if you are on an archlinux installation.

[//]: # (Screw you if you aren't. Talking about you, Tim.)

### home setup

```
## distribution independent
setup-zsh-deps
setup-appimages

## for a more complete setup
setup-home
```

### Notes
git ssh url alias -\
ssh://host\<rest-of-the-url\>\
host = user@alias\
The name of the key file (or the comment) seems to have to match the username.
