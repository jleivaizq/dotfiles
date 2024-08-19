# Shortcut to this dotfiles
export DOTFILES=$HOME/.dotfiles

# Save secret crap inside ~/.localrc
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

TOOLS="$HOME/.rvm/bin"
PATH=/usr/local/bin:$PATH:$TOOLS

# All ZSH files inside dotfiles/zsh
typeset -U config_files
config_files=($DOTFILES/*/*.zsh)

# Load config files
for file in ${config_files}
do
  source $file
done
