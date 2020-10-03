export EDITOR="vim"

function parse_version_control() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ ! "${BRANCH}" == "" ]
    then
        echo " | [git:${BRANCH}${STAT}]"
    else
        SVN=`svn info 2> /dev/null | grep Revision | cut -f 2 -d " "`
        if [ ! "${SVN}" == "" ];
        then
            echo " | [svn:${SVN}]"
        else 
            echo ""
        fi
    fi
}

alias ubash="source ~/.bashrc"
alias ebash="vim ~/.bashrc"
alias ealias="vim ~/.bash_aliases"
alias claer="clear"
alias upd="sudo apt update && sudo apt upgrade"
alias ins="sudo apt install"
alias arm="sudo apt remove --purge"
alias gcom="git add -A && git commit -am"
alias lt="tree"
alias v="vim"
alias save-config="cp -R ~/.config/xfce4/* ~/Projects/dotfiles/xfce/ && cp /usr/share/rofi/themes/config.rasi ~/Projects/dotfiles/rofi/ && cd ~/Projects/dotfiles && git status && cp ~/.bash_aliases ~/Projects/dotfiles"

PS1='\n\[\e[00;36m\]\h\[\e[00;32m\]`parse_version_control`\n\[\e[00;33m\](\w)\[\e[00;37m\]\n$ \[\e[0m\]'
