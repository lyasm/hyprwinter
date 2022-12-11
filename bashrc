#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
eval "$(starship init bash)"
#PS1='[\u@\h \W]\$ 'powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /usr/share/powerline/bindings/bash/powerline.sh
PS0='running command \! in \w \n \s Version: \V \n \t \n'

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

#aliases
alias neofetch='neowofetch'
alias neofetchlol='bash lolcat.sh'
alias eww="/home/paul/eww/target/release/eww"
alias snowfetch="neofetch --source ~/test.txt | lolcat -a -s 40 -d 10 -S 55 -p 1.5"
alias barreload="killall -SIGUSR2 waybar"

#PATH
export PATH="$HOME/bin:$PATH"
. "$HOME/.cargo/env"
