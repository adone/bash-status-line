set -e

NONE="\033[0m"    # unsets color to term fg color
R="\033[0;31m"    # red
G="\033[0;32m"    # green
Y="\033[0;33m"    # yellow
B="\033[0;34m"    # blue

if [ ! -n "$BSL" ]
  then
    BSL=~/.bsl
fi

if [ -d "$BSL" ]
  then
    echo "${Y}You already have Bash Status Line installed.${NONE}You'll need to remove $BSL if you want to install"
    exit
fi

echo "${B}Cloning Bash Status Line...${NONE}"
hash git >/dev/null && /usr/bin/env git clone https://github.com/ADone/bash-status-line.git $BSL || {
  echo "${R}git not installed${NONE}"
  exit
}

sed -i -e "/^BSL=/ c\\
BSL=$BSL
" $BSL/bslrc.sh

echo "[[ -s \"$BSL/bslrc.sh\" ]] && source \"$BSL/bslrc.sh\"" >> $HOME/.bashrc

echo "${G}Successfuly installed. ${NONE} Reload your session to start using Bash Status Line"