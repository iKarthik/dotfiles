echo "Running rcup ----------------------"
env RCRC="$HOME/dev/dotfiles/rcrc rcup"

if [ -r "$HOME/dev/dotfiles/rcrc" ]; then
  echo "Updating dotfiles ..."
  rcup
fi
