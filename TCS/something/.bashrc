# vim: syn=sh:

###### . ~/.commonshrc

# history
    export HISTCONTROL=ignoreboth
    export HISTTIMEFORMAT="%F %T "

# completion
    complete -o bashdefault -o default -o nospace -F _git g
    complete -o bashdefault -o default -o nospace -F _git pg

# prompt
    _date=`git config --get-color "" "blue bold"`
    _path=`git config --get-color "" "yellow bold"`
    reset=`git config --get-color "" "reset"`
    _prompt_color=red

    [ -f ~/.bashrc.local ] && . ~/.bashrc.local
    # expect ".bashrc.local" to have "_prompt_color=color", where color is from
    # man git-config.  You can also have "color reverse" (I use that for root)

    _prompt=`git config --get-color "" "$_prompt_color bold"`
    PS1="$_prompt\u@\h$reset: $_date\t $_path\w$reset\n\$ "

    _red=`git config --get-color "" "red bold reverse"`
    source ~/.bashrc.git_prompt
    _prompt_command() {
        local ec=$?
        [ $ec -ne 0 ] && echo -n "$_red$ec $reset"
        git_prompt_string
    }
    PROMPT_COMMAND=_prompt_command

    unset _date _path _prompt_color _prompt

# fzf
    source /usr/local/.fzf/shell/completion.bash
    source /usr/local/.fzf/shell/key-bindings.bash
    # anything below that I did not write myself came from the above key-bindings.bash file)

    # # get back default ^R keybinding; we don't like the fzf history widget because it forces an extra keystroke!
    # bind '"\C-r": reverse-search-history'
    # # bind alt-S to the fzf history widget so we can call on it when we really need it
    # # (unlike in our zsh version, binding alt-R fails, I suppose because it is already used for something else
    # bind '"\es": " \C-e\C-u\C-y\ey\C-u`__fzf_history__`\e\C-e\er\e^"'

    # our own mods: Alt-, to get ANY previous argument! (code modeled after similar code in key-bindings.bash above)
    if [[ $- == *i* ]]; then
        # ALT-, - Paste the selected argument(s) into the command line (only arguments of 3 or more characters)
        bind -x '"\e,": "fzf-arg-widget"'
    fi
    fzf-arg-widget() {
        local selected="$(fc -ln -9999 | tac | perl -lanE 'for(@F) { s/;$//; next unless /.../; say $_ unless $seen{$_}++; }' | fzf --no-sort)"
        echo "selected=$selected" >&2
        READLINE_LINE="${READLINE_LINE:0:$READLINE_POINT}$selected${READLINE_LINE:$READLINE_POINT}"
        READLINE_POINT=$(( READLINE_POINT + ${#selected} ))
    }

    # ---- cue begin
    # select from "~/.bash_commands" (used to be called
    # ~/.config/cue-commands, hence the function name).  Just type some
    # (optional) string then hit Ctrl-X Ctrl-R.  See ~/.bash_commands for
    # examples of how to add commands.  This is mainly for commands that are
    # (a) important enough to record, (b) too hard/complex to remember/type
    # but (c) not *frequent* enough to pollute the alias/function namespace!
    function cue-select() {
        BUFFER=$(fzf < ~/.bash_commands -q "$READLINE_LINE")
        READLINE_LINE=$BUFFER
        READLINE_POINT=${#BUFFER}
    }
    bind -x '"\C-x\C-r": cue-select'
    # ---- cue end

    export FZF_DEFAULT_OPTS='--exact --multi --no-sort --reverse --info=inline'
    # export FZF_DEFAULT_COMMAND="fd -HI -L -E .git -E .cache -E .stversions -t f"
    # export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    # # WARNING: this will miss empty directories, because we are kludging
    # # something meant to find *files*, into finding directories!
    # export FZF_ALT_C_COMMAND="fd -HI -L -E .git -E .cache -E .stversions -t d"

# useful aliases and functions

    alias -- -='cd -'

    # ls - plain listings
    alias l='ls'
    alias la='ls -A'
    alias ll='ls -l'
    alias lla='ls -lA'
    # ls - sort by size, short only, increasing only
    alias lss='ls -sSr'
    # ls - sort by time, reverse only
    alias lt='ls -ltr'
    alias lta='ls -ltrA'
    alias lc='ls -ltrc'
    alias lca='ls -ltrcA'

    alias dfm='df -mT -x tmpfs'
    alias duk='du -sk'
    alias dum='du -sm'

    count() {
        sort | uniq -c | sort -n -r
    }

    total() {
        # take the first "number" on each line of STDIN and total 'em
        sed -e 's/^[^0-9.-]*//' -e 's/[^0-9.-].*//' | paste -sd+ | bc -l
    }

    Ym() { date +%Y-%m; };
    Ymd() { date +%Y-%m-%d; }

    alias xo=xdg-open

    # if command -v rg >/dev/null; then
    #     alias rg='command rg'
    # else
        alias rg='grep -D skip -E -I --exclude-dir=.git -i'
    # fi

    hili() {
        # assume simple words in hili, no metas
        local patts="$*"
        patts=${patts// / -e }
        patts="-e $patts"
        echo $patts
        [[ $SHELL == /bin/zsh ]] && setopt SH_WORD_SPLIT
        grep -E -i --color=always -e $ -e '@[a-z0-9.:_-]+' -e '[a-z0-9.:_-]+: ' $patts
        [[ $SHELL == /bin/zsh ]] && setopt NO_SH_WORD_SPLIT
    }

    alias v=vim
    alias v0="v -c 'normal \`0'"
    alias v1="v -c 'normal \`1'"
    alias v2="v -c 'normal \`2'"

    vw() { vim `which "$@"`; } #
    vm() (
        grep '^> ' ~/.viminfo |
            cut -c3- |
            sed -e "s|~|$HOME|" |
            xargs -d $'\n' realpath -eq --relative-base="$PWD" |
            fzf --preview='cat {}' --bind alt-a:select-all -1 -q "$*" |
            xargs -r -o -d '\n' vim
    )
    vg() {
        vim -c "grep $*" -c "let @/='$1'" -c "copen"
        : "handle -i using \\C; -w using \\< and \\>; add dirnames to limit search"
    }
    vd() {
        fzf -1 --bind alt-a:select-all --preview-window=right:67%:wrap '--preview=bat --color always {}' -q "$*" | xargs -r -o -d '\n' vim
        : "can handle any number of patterns (use those to limit to a subdir also; e.g. 'vd repo-sp t/'"
    }

    die() { echo "$@" >&2; exit 1; }
    warn() { echo "$@" >&2; }

# git

    # alias g='git --no-pager'
    # alias pg='git -p'
    # alias g-='git co -'
    glg() { git lg --color=always -${1:-5} | less -RF; }

# security

    # umask 077
    # unset LESSOPEN LESSCLOSE LESSECHO LESSGLOBALTAGS
    # # this is more than recommended in http://seclists.org/fulldisclosure/2014/Nov/74; may have to scale back later

# env vars

    # # set up MY_SHLVL
    # export MY_SHLVL=${MY_SHLVL:-$MY_SHLVL}
    # {
    #     _sl=$(basename -- $(tr '\0' '\n' < /proc/$PPID/cmdline | head -1 || :) | grep -v -e tmux -e su -e terminal -e sshd)
    #     [[ -n ${_sl-} ]] && MY_SHLVL=$_sl:${MY_SHLVL-}
    # }

    export EDITOR=vim
    export LESS=-Mij9XS
    export TZ=:/etc/localtime
    # https://blog.packagecloud.io/eng/2017/02/21/set-environment-variable-save-thousands-of-system-calls/
    # no idea why the extra ":" at the start

    # not sure if we need these
    # export XDG_CONFIG_HOME=$HOME/.config
    # export DISPLAY; DISPLAY=${DISPLAY:-:0}

    # 2020-06-03, from https://raw.githubusercontent.com/Aperocky/unix-setup/master/.bashrc
    export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode – red
    export LESS_TERMCAP_md=$(printf '\e[01;32m') # enter double-bright mode – (was 32, green)
    export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
    export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode
    export LESS_TERMCAP_so=$(printf '\e[01;41m') # enter standout mode – red (was 33, yellow)
    export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
    export LESS_TERMCAP_us=$(printf '\e[04;36m') # enter underline mode – cyan

# bookmark directories: "bm" and "to" functions (require fzf)

    bm() {
        # usage: bm bookmark (bookmarks current directory)
        [ -f ~/.config/to ] || touch ~/.config/to   # prevent grep errors on first use
        if grep -E $PWD'$' ~/.config/to; then
            echo ...already exists
        else
            echo "$PWD" >> ~/.config/to
        fi
    }

    to() {
        # convert more convenient "-foo" to "!foo" for fzf
        q=" $*"         # the extra space does not seem to matter to fzf
        q=${q// -/ !}   # but it makes handling a leading "-" easier

        cd "$(fzf -1 +m -q "$q" < ~/.config/to)"
    }

# misc

    # create a temporary directory to work in; kill it when the shell exits
    tmp()
    (
        export MY_SHLVL=tmp:$MY_SHLVL
        export od=$PWD
        export tmp=$(mktemp -d)
        trap "rm -rf $tmp" 0
        cd $tmp
        if [ -z "$1" ]
        then
            $SHELL -l
        else
            [ "$1" = "-l" ] && {
                shift
                set "$@" ";" "$SHELL -l"
            }
            eval "$@"
        fi
    )

    # print stuff in a specific color (rgb = 31, 32, 34)
    ansi() {
        : "rgb = 31, 32, 34"
        color=$1; shift
        echo -ne "\e[4m\e[${color}m"
        echo -n "$@"
        echo -e "\e[4m\e[0m"
    }

    # edit x clipboard
    bv() {
        [[ -t 0 ]] || cat | xsel -b
        xsel -b | VISUAL="gvim -f" vipe | tee ~/.junk.vx | xsel -b
    }
    # shift x clipboard by 4 spaces
    # b4() {
    #     [[ -t 0 ]] || cat | xsel -b
    #     xsel -b | sed -e 's/^/    /' | tee ~/.junk.v4 | xsel -b
    # }

    # # replace strings in files
    # InPlaceEdit() {
    #     local op=g
    #     [[ $1 == -i ]] && { op=gi; shift; }
    #     perl -w -0777 -pi -e "s($1)($2)$op" "${@:3}"
    # }
    # # paragraph sort / reverse
    # sort-p() { perl -00 -e "print sort <>"; }
    # sort-pr() { perl -00 -e "print reverse sort <>"; }


