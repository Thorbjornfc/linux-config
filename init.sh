read -n 1 -s -r -p "Warning! Continuing replaces current '.bashrc' and '.inputrc'. Press Y to continue, any other key to exit: " input
if [[ "$input"!="y" && "$input"!="Y" ]]; then
  echo ""
  exit 0
fi

if [[ -f ~/.bashrc ]]; then
  rm ~/.bashrc
fi
ln -s ~/.config/rc/.bashrc ~/.bashrc

if [[ -f ~/.inputrc ]]; then
  rm ~/.inputrc
fi
ln -s ~/.config/rc/.inputrc ~/.inputrc
source ~/.bashrc
bind -f ~/.inputrc
