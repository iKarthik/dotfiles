
#!/bin/sh

# Welcome to the thoughtbot laptop script!
# Be prepared to turn your laptop (or desktop, no haters here)
# into an awesome development machine.

fancy_echo() {
  local fmt="$1"; shift
  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

fancy_echo "Setting homebrew chown permissions"
sudo chown -R $(whoami) /usr/local/var/homebrew

fancy_echo "Setting /usr/local chown permissions"
sudo chown -R `whoami` /usr/local



append_to_zshrc() {
  local text="$1" zshrc
  local skip_new_line="${2:-0}"

  if [ -w "$HOME/.zshrc.local" ]; then
    zshrc="$HOME/.zshrc.local"
  else
    zshrc="$HOME/.zshrc"
  fi

  if ! grep -Fqs "$text" "$zshrc"; then
    if [ "$skip_new_line" -eq 1 ]; then
      printf "%s\n" "$text" >> "$zshrc"
    else
      printf "\n%s\n" "$text" >> "$zshrc"
    fi
  fi
}

# shellcheck disable=SC2154
trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT

set -e

if [ ! -d "$HOME/.bin/" ]; then
  mkdir "$HOME/.bin"
fi

if [ ! -f "$HOME/.zshrc" ]; then
  touch "$HOME/.zshrc"
fi

# shellcheck disable=SC2016
append_to_zshrc 'export PATH="$HOME/.bin:$PATH"'

HOMEBREW_PREFIX="/usr/local"

if [ -d "$HOMEBREW_PREFIX" ]; then
  if ! [ -r "$HOMEBREW_PREFIX" ]; then
    sudo chown -R "$LOGNAME:admin" /usr/local
  fi
else
  sudo mkdir "$HOMEBREW_PREFIX"
  sudo chflags norestricted "$HOMEBREW_PREFIX"
  sudo chown -R "$LOGNAME:admin" "$HOMEBREW_PREFIX"
fi

update_shell() {
  local shell_path;
  shell_path="$(which zsh)"

  fancy_echo "Changing your shell to zsh ..."
  if ! grep "$shell_path" /etc/shells > /dev/null 2>&1 ; then
    fancy_echo "Adding '$shell_path' to /etc/shells"
    sudo sh -c "echo $shell_path >> /etc/shells"
  fi
  sudo chsh -s "$shell_path" "$USER"
}

case "$SHELL" in
  */zsh)
    if [ "$(which zsh)" != '/usr/local/bin/zsh' ] ; then
      update_shell
    fi
    ;;
  *)
    update_shell
    ;;
esac


if ! command -v brew >/dev/null; then
  fancy_echo "Installing Homebrew ..."
    curl -fsS \
      'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby

    append_to_zshrc '# recommended by brew doctor'

    # shellcheck disable=SC2016
    append_to_zshrc 'export PATH="/usr/local/bin:$PATH"' 1

    export PATH="/usr/local/bin:$PATH"
fi

if brew list | grep -Fq brew-cask; then
  fancy_echo "Uninstalling old Homebrew-Cask ..."
  brew uninstall --force brew-cask
fi

fancy_echo "Updating Homebrew formulae ... ----------------------"
brew update --force # https://github.com/Homebrew/brew/issues/1151
brew bundle --file=- <<EOF
tap "thoughtbot/formulae"
tap "homebrew/services"
tap "universal-ctags/universal-ctags"

#rcm
brew install rcm

# Unix
brew "universal-ctags", args: ["HEAD"]
brew "git"
brew "openssl"
brew "rcm"
brew "reattach-to-user-namespace"
brew "the_silver_searcher"
brew "tmux"
brew "vim"
brew "watchman"
brew "zsh"

EOF

fancy_echo "Running rcup ----------------------"
env RCRC="$HOME\dev\dotfiles\rcrc rcup"


if [ -f "$HOME/.laptop.local" ]; then
  fancy_echo "Running your customizations from ~/.laptop.local ..."
  # shellcheck disable=SC1090
  . "$HOME/.laptop.local"
fi
