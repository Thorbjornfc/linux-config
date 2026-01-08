if [[ -f ~/.bashrc ]]; then
  rm ~/.bashrc
fi
ln -s ~/.config/rc/.bashrc ~/.bashrc

if [[ -f ~/.inputrc ]]; then
  rm ~/.inputrc
fi
ln -s ~/.config/rc/.inputrc ~/.inputrc
