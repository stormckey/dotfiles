#Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#Enable autosuggestion
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#Enable syntax highlight
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#enable autojump
#
[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh

#alias
alias cv="g++ $(pkg-config --cflags --libs opencv3)"
alias sudo='sudo '
#alias rm='echo "use trash-put"'
alias tp='trash-put'
alias te='trash-empty'
alias tl='trash-list'
alias proxy="export http_proxy=http://10.162.243.132:7890 https_proxy=http://10.162.243.132:7890 all_proxy=http://10.162.243.132:7890"
alias powersave="tuned-adm profile laptop-battery-powersave"
alias performance="tuned-adm profile latency-performance"
alias turbo="sudo turbostat --Summary --quiet --show PkgWatt --interval 1 | gawk '{ printf(\"%.2f\\n\" , \$1); fflush(); }' | ttyplot -s 100 -t \"Turbostat - CPU Power (watts)\" -u \"watts\""
alias ff="fd . | grep --color=always"
alias ls="eza --icons"
alias pad='nmcli dev wifi connect "153******76的MatePad Air" password 88888888'
alias xiaomi='nmcli dev wifi connect "Xiaomi 13" password 88888888'
alias ll="eza --icons --long --all"
alias gs="git status"
alias ga="git add ."
alias gc="git commit"
alias gp="git push"
alias lt='eza -a --tree --level=1 --icons'
alias clear="/usr/bin/clear"
alias vim="nvim"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# env vars
export EDITOR=nvim
export LIBVIRT_DEFAULT_URI='qemu:///system'
export HISTFILE=~/.zsh_history
export PATH=$PATH:~/.local/bin:~/.cargo/bin

#OCaml env
eval $(opam env)

#the copy cut and paste from https://askubuntu.com/questions/400152/how-to-copy-and-paste-a-file
copy() {
    # if the number of arguments equals 0
    if [ $# -eq 0 ]
    then
        # if there are no arguments, save the folder you are currently in to the clipboard
        pwd | xclip
    else
        # save the number of argument/path to `~/.numToCopy` file.
        echo $# > ~/.numToCopy

        # save all paths to clipboard
        # https://stackoverflow.com/q/5265702/9157799#comment128297633_5265775
        realpath -s "$@" | xclip
    fi

    # mark that you want to do a copy operation
    echo "copy" > ~/.copyOrCut
}

cut() {
    # use the previous function to save the paths to clipboard
    copy "$@"

    # but mark it as a cut operation
    echo "cut" > ~/.copyOrCut
}

paste() {
    # for every path
    for ((i=1; i <= $(cat ~/.numToCopy); i++))
    do
        # get the nth path
        pathToCopy="$(xclip -o | head -$i | tail -1)"

        if [ -d "$pathToCopy" ] # If it's a directory
        then
            cp -r "$pathToCopy" .
        else
            cp "$pathToCopy" .
        fi

        # if it was marked as a cut operation
        if [ $(cat ~/.copyOrCut) = "cut" ]
        then
            # delete the original file
            tp -r "$pathToCopy"
        fi
    done
}
eval "$(atuin init zsh)"
export QT_QPA_PLATFORM=xcb
export ANDROID_HOME=/home/stormckey/Android/Sdk
source /usr/share/nvm/init-nvm.sh
export ANDROID_HOME=/home/stormckey/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin

#for pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
