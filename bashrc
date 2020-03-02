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

PS1='\n\[\e[00;36m\]\h\[\e[00;32m\]`parse_version_control`\n\[\e[00;33m\](\w)\[\e[00;37m\]\n$ \[\e[0m\]'
