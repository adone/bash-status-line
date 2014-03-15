set -e

if [ ! -n "$BSL" ]
  then
    BSL=~/.bsl
fi

if [ -d "$BSL" ]
  then
    echo "${Y}You already have Bash Status Line installed.${NONE}You'll need to remove $BSL if you want to install"
    exit
fi

echo "${B}Cloning Bash Status Line..."
hash git >/dev/null && /usr/bin/env git clone  $BSL || {
  echo "${R}git not installed"
  exit
}

sed -i -e "/^BSL=/ c\\
BSL=$BSL
" $BSL/bslrc.sh

echo "[[ -s \"$BSL/bslrc.sh\" ]] && source \"$BSL/bslrc.sh\"" >> $HOME/.bashrc

echo "${G}Successfuly installed. ${NONE} Reload your session to start using Bash Status Line"