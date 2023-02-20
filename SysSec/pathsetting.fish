if status is-interactive
    # Commands to run in interactive sessions can go here
end
# set PATH /home/knightfall/.bin/ PATH
set -U fish_greeting ""
cat /home/knightfall/.cache/wal/sequences
# neofetch
export OPENAI_API_KEY='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'
# colorscript -e bars
colorscript -e blocks1
alias l="exa -all"
alias ls="exa"
alias nivm="nvim"
alias open="xdg-open"
alias pic="kitty +kitten icat"
# starship init fish | source
alias githubtoken="echo Github Token = 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"
fish_add_path /home/knightfall/.spicetify

export PATH="$PATH:/home/knightfall/.bin"

export PATH="$PATH:/home/knightfall/Music"
