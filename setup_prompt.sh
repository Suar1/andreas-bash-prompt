#!/usr/bin/env bash

setup-bash-prompt() {
    if [ -z "$BASH_VERSION" ]; then
        echo "This script only configures bash. Current shell: $SHELL"
        exit 1
    fi

    if grep -q "PROMPT_COMMAND=promptcmd" ~/.bashrc; then
        echo "Bash prompt already configured in ~/.bashrc"
        exit 0
    fi

    cat << 'EOF' >> ~/.bashrc

# ---- Custom Bash Prompt ----
WHITE='\[\033[1;37m\]'; LIGHTRED='\[\033[1;31m\]'; LIGHTGREEN='\[\033[1;32m\]'; LIGHTBLUE='\[\033[1;34m\]'; DEFAULT='\[\033[0m\]'
cLINES=$WHITE; cBRACKETS=$WHITE; cERROR=$LIGHTRED; cSUCCESS=$LIGHTGREEN; cHST=$LIGHTGREEN; cPWD=$LIGHTBLUE; cCMD=$DEFAULT

promptcmd() {
    PREVRET=$?
    PS1="\n"
    if [ $PREVRET -ne 0 ]; then
        PS1="${PS1}${cBRACKETS}[${cERROR}x${cBRACKETS}]${cLINES}\342\224\200"
    else
        PS1="${PS1}${cBRACKETS}[${cSUCCESS}*${cBRACKETS}]${cLINES}\342\224\200"
    fi
    PS1="${PS1}${cBRACKETS}[${cHST}\h${cBRACKETS}]${cLINES}\342\224\200"
    PS1="${PS1}[${cPWD}\w${cBRACKETS}]"
    PS1="${PS1}\n${cLINES}\342\224\224\342\224\200\342\224\200> ${cCMD}"
}
PROMPT_COMMAND=promptcmd
# ---- End Custom Bash Prompt ----
EOF

    echo "Custom bash prompt added. Reloading..."
    source ~/.bashrc
}

setup-bash-prompt
