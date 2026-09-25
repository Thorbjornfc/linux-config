Help() {
  echo "Replaces '~/.bashrc' and '~/.inputrc', with symlinks to files of same name in '~/.config/rc/'."
  echo
  echo "  -f  Force overwrite, don't ask permission to overwrite."
  echo
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  EXIT_CMD="exit"
else
  EXIT_CMD="return"
fi

PROCEED="false"
FORCE="false"
OLD_INPUTRC="$HOME/.inputrc"
OLD_BASHRC="$HOME/.bashrc"
INPUTR="$HOME/.config/rc/.inputrc"
BASHRC="$HOME/.config/rc/.bashrc"

OPTIND=1
while getopts ":hf." option; do
  case $option in
  h) # display Help
    Help
    "$EXIT_CMD" 0
    ;;
  f) # force overwrite, dont ask permission
    FORCE="true" ;;
  \?) # Invalid option
    echo "Error: Invalid option"
    Help
    "$EXIT_CMD" 1
    ;;
  esac
done

if [[ "$FORCE" != "true" ]]; then
  read -n 1 -s -r -p "Warning! Continuing replaces current '~/.bashrc' and '~/.inputrc'. Press Y to continue, any other key to exit: " input
  echo
  if [[ "$input" != "y" && "$input" != "Y" ]]; then
    echo "exit"
    "$EXIT_CMD" 0
  fi
fi

for f in ".bashrc" ".inputrc"; do
  if [[ ! -f ~/.config/rc/$f ]]; then
    echo "Error: ~/.config/rc/$f not found."
    "$EXIT_CMD" 1
  fi
done

if [[ -f $OLD_BASHRC ]]; then
  rm $OLD_BASHRC
fi
ln -s $BASHRC $OLD_BASHRC

if [[ -f $OLD_INPUTRC ]]; then
  rm $OLD_INPUTRC
fi
ln -s $INPUTR $OLD_INPUTRC
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  echo "Done. Run 'source $OLD_BASHRC && bind -f $OLD_INPUTRC' to reload."
else
  source $OLD_BASHRC
  bind -f $OLD_INPUTRC
fi
