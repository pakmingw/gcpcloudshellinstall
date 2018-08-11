# gcpcloudshellinstall
Google Cloud Platform Cloud Shell install scripts for vim / git power users.  These scripts assume that you are comfortable with tmux and vim with the vundle plugin manager.

tmux: https://github.com/tmux/tmux

vundle: https://github.com/VundleVim/Vundle.vim

NOTE: There are post installation steps after the script. Please review the .bash_profile for added aliases and shortcuts.

Installation Steps:
0. Carefully review the install_shell.sh. This shell script assumes you are using a machine for the first time. If this is not the case, you may want to comment out some of initial update / upgrade steps.

1. Install this by cloning this repository into your cloud shell / utility server and running the install script.

2. Launch vim and issuing :PluginInstall to complete the vundle plugin installation. Issue :bdelete to exit the buffer and return to vim.

3. Restart the cloud shell and you should be good to go.

Enjoy!

Pak
p.s. many thanks to Javier for the initial base scripts
