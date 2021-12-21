## -----------------------------------------------------------------------------------------
## fish aliases by Junjue Wang <junjuew@cs.cmu.edu>
## inspired by Vivek Gite <vivek@nixcraft.com>
## http://www.cyberciti.biz/tips/linux-unix-osx-bash-shell-aliases.html
## -----------------------------------------------------------------------------------------
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias bc='bc -l'
alias sha1='openssl sha1'
alias mkdir='mkdir -pv'
alias diff='colordiff'
alias h='history'
alias j='jobs -l'
alias path='echo -e $PATH'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
alias vi=vim
alias svi='sudo vi'
alias vis='vim "+set si"'
alias edit='vim'
alias ping='ping -c 5'
alias fastping='ping -c 100 -s.2'
alias ports='netstat -tulanp'
alias header='curl -I'
alias headerc='curl -I --compress'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias sapt='sudo aptitude'
alias supdate='sudo aptitude update; and sudo aptitude safe-upgrade'
alias root='sudo -i'
alias su='sudo -i'
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'
alias httpdreload='sudo /usr/sbin/apachectl -k graceful'
alias httpdtest='sudo /usr/sbin/apachectl -t ; and /usr/sbin/apachectl -t -D DUMP_VHOSTS'
alias meminfo='free -m -l -t'
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
alias cpuinfo='lscpu'
alias wget='wget -c'
alias chrome='/opt/google/chrome/chrome'
alias browser=chrome
alias df='df -H'
alias du='du -ch'
alias top='htop'
alias gits='git status'
alias gita='git add'
alias gitau='git add -u'
alias gitc='git commit -m'
alias gitp='git push'
alias gitpo='git push origin'
alias gitpom='git push origin master'
alias xclip="xclip -selection c"
alias python='python -B'
alias fpp='fpp -ni'
alias lg='lazygit'
alias find='echo "Use fd, the modern find."; false'
alias cat='bat'
alias grep='echo "Use rg, the modern grep"; false'
alias rm='echo "Use trash-*, the modern rm"; false'
alias ls='exa'
alias l='exa -la'
alias man='tldr'
alias tar='echo "Use atool, the modern tar"; false'
alias zip='echo "Use atool, the modern zip"; false'
# fasd shortcuts
alias v='f -e vim' # quick opening files with vim
alias m='f -e mplayer' # quick opening files with mplayer
alias o='a -e xdg-open' # quick opening files with xdg-open
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection
alias tmup='bass (tmux showenv -s)'
alias tmdev='tmux has-session -t dev && tmux attach -t dev || tmux new -s dev'

