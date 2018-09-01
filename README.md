# gcpcloudshellinstall
Google Cloud Platform Cloud Shell install scripts for vim / git power users.  These scripts assume that you are comfortable with tmux and vim with the vundle plugin manager.

tmux: https://github.com/tmux/tmux

vundle: https://github.com/VundleVim/Vundle.vim

A fantastic introduction to tmux can be found here: https://lukaszwrobel.pl/blog/tmux-tutorial-split-terminal-windows-easily/

NOTE: There are post installation steps after the script. Please review the `.bash_profile` for added aliases and shortcuts. Also note that the initial config has unbound `Ctrl-B` to `Ctrl-Q`. You can alter this to suit your taste.

Installation Steps:
1. Carefully review the `install_shell.sh`. This shell script assumes you are using a machine for the first time. If this is not the case, you may want to comment out some of initial update / upgrade steps.
1. Install this by cloning this repository into your cloud shell / utility server and running the install script.
1. Launch vim and issuing `:PluginInstall` to complete the vundle plugin installation. Issue `:bdelete` to exit the buffer and return to vim.
1. Restart the cloud shell and you should be good to go.

Enjoy!

Pak
p.s. This is mainly due to the great work of Javier Canadillas for the majority of the initial base scripts.

## Mac Users
For mac users who wish to use this configuration for their OS X machines for a more consistent feel on-prem and in the cloud, you need to manually install tmux with homebrew. You can then follow step 2 above and then restart your terminal.  I recommend using the Homebrew themed terminal as default.

`brew install tmux`

homebrew: https://brew.sh/

## Quick Tutorial to gcpcloudshellinstall / tmux
If you got this far, here's a quick tutorial to get you started.
1. Press `Ctrl-Q` then type `c` to create new session. `Ctrl-Q` is the keyboard command to tmux to start issuing commands. In this case, tmux will create a new session as a tab in your terminal.
1. Press `Ctrl-Q` then type `n` to go to the next session or `p` to go to the previous session. You should move to the other tab.
1. Press `Ctrl-Q` then type `m` to go to mouse mode. You should be able to click between the tabs on the terminal to switch tab.
1. Press `Ctrl-Q` then type `M` to turn off mouse mode. Type `exit` to close a tab.

## Notes on git shell integration
If you note on your shell there are a couple of things that are important:
* If in a git repository, the branch will be shown
* A + sign indicates new files ready to commit
* A green prompt indicates an exit code of 0 from the last command (i.e. OK). A red prompt indicates an exit code of 1 from the last command (i.e. you should probably look at what went wrong!).
