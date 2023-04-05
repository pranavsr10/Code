# vim: syn=zsh:

# command line editing
    bindkey -e
        # I'd love use the vi mode but it's been crippled by the GNU fanbois
        # (even in bash).  First, it doesn't seem to do the eqvt of
        # 'incsearch'.  Next, I can't figure out how to "alt-.".  I'm sure
        # there are other issues!
    # make ^Z do "fg" (from # http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/)
    fancy-ctrl-z () {
        if [[ $#BUFFER -eq 0 ]]; then
            BUFFER="fg"
            zle accept-line
        else
            zle push-input
            zle clear-screen
        fi
    }
    zle     -N      fancy-ctrl-z
    bindkey '^Z'    fancy-ctrl-z

# completion
    fpath=($HOME/.config/zsh.fpath $fpath)

    [[ $WORDCHARS =~ ^: ]] || WORDCHARS=":$WORDCHARS"

    # from https://destinmoulton.com/blog/2018/how-to-disable-zsh-ssh-hosts-completion/
    zstyle ':completion:*:ssh:*' hosts off
    zstyle ':completion:*:scp:*' hosts off
    zstyle ':completion:*:rsync:*' hosts off

    # the following from running compinstall one fine day
    zstyle ':completion:*' completer _complete _ignored
    zstyle ':completion:*' file-sort name
    zstyle ':completion:*' group-name ''
    zstyle ':completion:*' list-colors ''
    zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
    zstyle ':completion:*' menu select=1
    zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

    zstyle ':completion:*' verbose yes
    zstyle ':completion:*:descriptions' format "%S%F{$PS1_color}%d%f%s"
    zstyle ':completion:*:messages' format '%d'
    zstyle ':completion:*:warnings' format 'No matches for: %d'
    zstyle ':completion:*' group-name ''

    autoload -U compinit
    compinit

    # this is needed to make named directories USABLE (i.e., ignore all the
    # other goddamn users on the system!)
    zstyle ':completion::complete:-tilde-::' tag-order '! users'
    zstyle ':completion::complete:cd::' tag-order '! users'

    # some cool stuff...
    zstyle ':completion:*:processes' command 'ps -eo pid,user,%cpu,args --sort -%cpu'
    zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'

    # expand aliases as I type space afterward
    # XXX I'm not sure if I want this yet.  At least I need to bind it to some
    # other key than space if I do
    # ea_si() { zle _expand_alias; zle self-insert; }; zle -N ea_si; bindkey ' ' ea_si

# moving around; for usage hints see nb zsh +S
    # the cdr command
    autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
    add-zsh-hook chpwd chpwd_recent_dirs

    setopt AUTO_CD
    # NEVER use that stupid CDABLE_VARS by the way!

# history
    alias h='fc -l -t "%F %T" -D'

    # zsh doesn't have HISTIGNORE, but since our needs are simple we fake it
    alias rm=' rm'
    alias fg=' fg'
    alias bg=' bg'
    alias fc=' fc'

    setopt APPEND_HISTORY EXTENDED_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE HIST_NO_STORE
    HISTFILE=~/.zsh_history
    HISTSIZE=1000
    SAVEHIST=1000
    # TODO -- convert to zshrc
    #     : find the 'history file directory' and set history
    #     hfd=$PWD
    #     while [[ -n "$hfd" ]]
    #     do
    #         [ -w $hfd/.bash_history ] && break
    #         hfd=${hfd%/*}
    #     done
    #     [[ -n "$hfd" ]] || hfd=$HOME
    #     [[ "$HISTFILE" != "$hfd/.bash_history" ]] && {
    #         history -w
    #         history -c
    #         HISTFILE=$hfd/.bash_history
    #         history -r
    #     }

# fzf
    # fedora
    [ -f /usr/share/zsh/site-functions/fzf     ] && source /usr/share/zsh/site-functions/fzf
    [ -f /usr/share/fzf/shell/key-bindings.zsh ] && source /usr/share/fzf/shell/key-bindings.zsh
    # manjaro
    [ -f /usr/share/fzf/completion.zsh         ] && source /usr/share/fzf/completion.zsh
    [ -f /usr/share/fzf/key-bindings.zsh       ] && source /usr/share/fzf/key-bindings.zsh
    # ubuntu
    [ -f /usr/share/doc/fzf/examples/key-bindings.zsh   ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
    [ -f /usr/share/doc/fzf/examples/completion.zsh     ] && source /usr/share/doc/fzf/examples/completion.zsh

    # get back default ^R keybinding; we don't like the fzf history widget because it forces an extra keystroke!
    bindkey '^R' history-incremental-search-backward
    # bind alt-R to the fzf history widget so we can call on it when we really need it
    bindkey '\er' fzf-history-widget

    # our own mods: alt-, (args), alt-/ (tmux show pane), alt-f (dir containing file)
    # (much of the code modeled after similar code in key-bindings.zsh above)
    if [[ $- == *i* ]]; then
        __asel() {
          local cmd="$cmd | tac | perl -MText::ParseWords -lnE '@F=shellwords(\$_); for(@F) { s/;\$//; next unless /.../; say \$_ unless \$seen{\$_}++; }'"
          setopt localoptions pipefail 2> /dev/null
          eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --no-sort $FZF_DEFAULT_OPTS" $(__fzfcmd) -m "$@" | while read item; do
            echo -n "${item} "
            # NOTE: removed a '(q)' just before 'item'
          done
          local ret=$?
          echo
          return $ret
        }

        # used by the next two...
        my-fzf-widget() {
          LBUFFER="${LBUFFER}$(__asel)"
          local ret=$?
          zle reset-prompt
          return $ret
        }

        my-fzf-widget-fc() {
          local cmd="fc -ln -9999"
          my-fzf-widget
        }
        zle     -N   my-fzf-widget-fc
        bindkey '\e,' my-fzf-widget-fc

        my-fzf-widget-tp() {
          local cmd="cat /tmp/.tmux.show.pane"
          my-fzf-widget
        }
        zle     -N   my-fzf-widget-tp
        bindkey '^b' my-fzf-widget-tp

        my-fzf-widget-cue() {
            LBUFFER=$(__ | fzf --no-multi -1 -q "$LBUFFER" | sed -e 's/ *#.*//')
            local ret=$?
            zle reset-prompt
            return $ret
        }
        zle     -N   my-fzf-widget-cue
        bindkey '\es' my-fzf-widget-cue

        # for bash, https://github.com/knqyf263/pet#bash had some tips.
        # Specifically, this works (adjust the fzf command as needed)
        # function cue-select() {
        #     BUFFER=$(fzf < ~/.bash_commands -q "$READLINE_LINE")
        #     # .bash_commands contains lines like:
        #     #       : "pick branch and checkout"            ;   git checkout `git branch | fzf | cut -c3-`
        #     #       : "find country of IP"                  ;   whois -h whois.cymru.com -v
        #     READLINE_LINE=$BUFFER
        #     READLINE_POINT=${#BUFFER}
        # }
        # bind -x '"\C-x\C-r": cue-select'

        my-cdf-widget() {
          local cmd="fd -HI -L -E .git -E .cache -t f"
          local file
          local dir
          file="$(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" $(__fzfcmd) +m)"
          dir=$(dirname "$file")
          if [[ -z "$dir" ]]; then
            zle redisplay
            return 0
          fi
          cd "$dir"
          local ret=$?
          zle fzf-redraw-prompt
          return $ret
        }
        zle     -N    my-cdf-widget
        bindkey '^f' my-cdf-widget
    fi


# perf/timing
    # XXX some of these fields don't show up!
    TIMEFMT="%U u %S s %P %*E | %W sw %F maj %R min | %X txt %D dat %M max"

# keyboard
    # adapted from https://wiki.archlinux.org/index.php/Zsh#Key_bindings
    typeset -A key

    key[Delete]=${terminfo[kdch1]}
    key[PageUp]=${terminfo[kpp]}
    key[PageDown]=${terminfo[knp]}

    bindkey  "${key[Delete]}"   delete-char     # this was bad, till it got fixed
    bindkey  "${key[PageUp]}"   history-beginning-search-backward
    bindkey  "${key[PageDown]}" history-beginning-search-forward
    bindkey  "^u"               backward-kill-line

# xterm title
    precmd () {print -Pn "\e]0;%n@%m: %~\a"}

# misc
    setopt NO_NO_MATCH
        # otherwise things like "ew foo.*bar" will make zsh complain that
        # there is no file that matches that pattern!

# local zshrc

    [ -f ~/.zshrc.local ] && . ~/.zshrc.local

# prompt.  Comes after local zshrc due to _prompt_color being set there
    source $HOME/.config/git_prompt.zsh

    # TODO: make %? go on its own line... (or, how to get a newline in the prompt)
    : ${_prompt_color:=$fg[red]$bg[blue]}
    PROMPT=$MY_SHLVL$RPS1%B%F{$_prompt_color}%*\ %1~\ %(\!.\#.\$)%f\ %(1j.%F{blue}%S%j%s%f\ .)%(?..%F{red}%S%?%s%f\ )%b
    [ "$USER" = "root" ] &&
    PROMPT=$MY_SHLVL$RPS1%B%S%F{$_prompt_color}%*\ %1~\ %(\!.\#.\$)%f%s\ %(1j.%F{blue}%S%j%s%f\ .)%(?..%F{red}%S%?%s%f\ )%b
    RPROMPT=%F{7}%w\ %n@%m\ %/%f

    setopt TRANSIENT_RPROMPT

# environment variables etc
    export EDITOR=vim
    export LESS=-Mij9XS

    export FZF_DEFAULT_OPTS='--exact --multi --no-sort --reverse --info=inline'
    export FZF_DEFAULT_COMMAND="fd -HI -L -E .git -E .cache -E .stversions -t f"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    # WARNING: this will miss empty directories, because we are kludging
    # something meant to find *files*, into finding directories!
    export FZF_ALT_C_COMMAND="fd -HI -L -E .git -E .cache -E .stversions -t d"

    export RIPGREP_CONFIG_PATH=$HOME/.config/ripgreprc

    # 2020-06-03, from https://raw.githubusercontent.com/Aperocky/unix-setup/master/.bashrc
    export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode – red
    export LESS_TERMCAP_md=$(printf '\e[01;32m') # enter double-bright mode – (was 32, green)
    export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
    export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode
    export LESS_TERMCAP_so=$(printf '\e[01;41m') # enter standout mode – red (was 33, yellow)
    export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
    export LESS_TERMCAP_us=$(printf '\e[04;36m') # enter underline mode – cyan

    # 2021-07-04; bat needs some help separating files!
    export BAT_PAGER="less +/File:.* -RF"

# (navigation) -, tt, bm/to, rr, tmp
    alias -- -='cd -'
    alias tt='cd /tmp/tmp'

# (disk/space) dfm, duk, dum
    alias dfm='df -mT -x tmpfs'
    alias duk='du -sk'
    alias dum='du -sm'

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

# (vim+bat) v, v0, v1, v2, vw, vm, :e, bw
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
            fzf --preview='bat {}' --bind alt-a:select-all -1 -q "$*" |
            xargs -r -o -d '\n' vim
    )

# (text_search) rg, lg, vgc (script)
    if command -v rg >/dev/null; then
        alias rg='command rg'
    else
        alias rg='grep -D skip -E -I --exclude-dir=.git -i'
    fi

    lg() { less +/"*$1" `rg -l "$1"`; };

# (text_search+vim) vg, vgc (script)
    vg() { vim -c "VG $*" -c "let @/='$1'"; : "handle -i using \\C; -w using \\< and \\>; add dirnames to limit search"; }

# if fzf and ripgrep are present, we assume fzf-vim is also present, and we redefine vg
    command -v fzf >/dev/null && command -v rg >/dev/null && {
        vg() {
            vim -c "Rg! $*" -c "let @/='$1'" -c "if @%=='' | quit | endif"
            : "takes only one argument to start with; add more later if you like"
        }
    }

# (dir_search+vim) vd
# it seems vim's :n `find` deals with spacenames quite nicely, so no need for "xargs -d '\n'"
    vd() { vim -c "VD $*"; : "can handle exactly one pattern, no subdirs/files"; }
# again, if fzf is present, we redefine vd
    command -v fzf >/dev/null && {
        vd() {
            fzf -1 --bind alt-a:select-all --preview-window=right:67%:wrap '--preview=bat --color always {}' -q "$*" | xargs -r -o -d '\n' vim
            : "can handle any number of patterns (use those to limit to a subdir also; e.g. 'vd repo-sp t/'"
        }
    }

# (compare+vim) vdf, vdd, Files
    vdf() {
        [ -d "$1" ] && set -- $1/$(basename $2) $2
        [ -d "$2" ] && set -- $1 $2/$(basename $1)
        vimdiff "$@"
    }
    vdd() {
        # does not handle arguments with spaces in them
        vim -c 'syntax off' -c "DirDiff $1 $2"
    }

# (git) g, pg, g-, glg
    alias g='git --no-pager'
    alias pg='git -p'
    alias g-='git co -'
    glg() { git lg --color=always -${1:-5} | less -RF; }

# (git+vim) gs, gk, gka
    alias gs="v -s <(echo gs; echo :only)"
    alias gk="v -s <(echo :GV; echo :tabonly)"
    alias gka="v -s <(echo :GV --all; echo :tabonly)"

# (files) ch, tcp, tmv, xo, LC
    tcp() { cp -v -a "$@" /tmp/tmp/; chmod -R go+rX /tmp/tmp 2>/dev/null ; }
    tmv() { mv -v    "$@" /tmp/tmp/; chmod -R go+rX /tmp/tmp 2>/dev/null ; }
    alias xo=xdg-open
    LC() {
        fd ${1:-.} ~/Downloads ~/x /tmp . --changed-within 10minutes -tf -X ls -1t | head -${2:-1}
    }

# (text_filters) field, hdt, hd, InPlace, sort-p/r, count, total, fess (less using fzf)
    field() { _f=$1; (( _f-- )); export _f; perl -lane "print \$F[$_f]"; }
    hdt() { perl -lpe 's/^\d{10}(?=\D)/localtime $&/e'; }
    alias hd='hexdump -C'
    InPlace() {
        local op=g
        [[ $1 == -i ]] && { op=gi; shift; }
        perl -w -0777 -pi -e "s($1)($2)$op" "${@:3}"
    }
    sort-p() { perl -00 -e "print sort <>"; }
    sort-pr() { perl -00 -e "print reverse sort <>"; }
    count() {
        sort | uniq -c | sort -n -r
    }
    total() {
        # take the first "number" on each line of STDIN and total 'em
        sed -e 's/^[^0-9.-]*//' -e 's/[^0-9.-].*//' | paste -sd+ | bc -l
    }
    fess() {
        fzf --preview-window=down:20%:wrap --preview="echo {}" --tac --no-sort
        : "pager using fzf"
        : "probably only useful for files with really long lines and you want to see them unwrapped, but see the *current* line wrapped"
    }

# (security) 2fe/2fd, DICEWORDS
    2fe() { gpg -c --cipher-algo twofish "$@"; }
    2fd() { gpg -d "$@"; }
    DICEWORDS() {
        egrep '^.{3,10}$' /usr/share/dict/words |
            tr -cd 'a-zA-Z0-9\012' |
            sort -u |
            shuf |
            head -100 |
            { [ -t 1 ] &&
                column | head ||
                cat | head;
            };
    }

