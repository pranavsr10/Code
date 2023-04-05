" vimrc
" vim: ts=24 fdm=expr fdl=0

" ----------------------------------------------------------------------
" to use your .vim and .vimrc on someone else's login:
"   export VIMINIT="so /your/.vimrc" (or alias vim to 'vim -u /your/.vimrc'),
"   then add a 'set rtp+=/your/.vim' line to your vimrc.

" ----------------------------------------------------------------------
" essential settings

    filetype plugin indent on
    syntax on

    set     autoindent
    set     background=dark
    set     expandtab
    set     hidden                      " Allow buffer switching without saving
    set     history=1000
    set     hlsearch
    set     ignorecase
    set     incsearch
    set     list
    set     listchars=tab:›\ ,trail:•,extends:#,nbsp:.
    set     matchpairs+=<:>
    set     modeline
    set     number
    set     shiftwidth=4
    set     showcmd
    set     showmatch
    set     showmode
    set     smartcase
    set     smartindent
    set     softtabstop=4
    set     tabstop=4
    set     textwidth=78

" ----------------------------------------------------------------------
" easy/simple settings

    set     backspace=indent,eol,start
    set     breakindent
            let    &showbreak = '↳ '
    set     breakindentopt=sbr,shift:4
    set     fillchars-=fold:-
    set   nofsync
    set     joinspaces
    set     laststatus=2
    set     linebreak
    set     nrformats=alpha,hex
    set     report=0
    set     scrolloff=2
    set     scrollopt=ver,jump,hor
    set     shortmess+=a                " ? we could add more flags if needed
    set     shortmess-=S
    set   noswapfile
    set   nottyfast
    set     wildmenu
    set     wildmode=list:longest,full

" ----------------------------------------------------------------------
" medium complexity settings
"
    " hit F1 in insert mode to get a date and time plus a tab, ready to type text
    inoremap    <F1>                    <C-R>=strftime('%F %H:%M')<CR><Tab>

    " allow "gq" for bullet lists using "*": remove mb:*, add fb:*
    set     formatoptions=qnj
    set     comments=s1:/*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-,fb:*,b:--,fb::

" ----------------------------------------------------------------------
" essential mappings

    nmap        <F2>                    :set wrap!<CR>

    nmap        <F3>                    :q<CR>
    nmap        <C-C>                   :q<CR>
    nmap        qq                      :qall<CR>

    nmap        <F9>                    :update<CR>
    imap        <F9>                    <C-O>:update<CR>
    nmap        <F10>                   :x<CR>
    imap        <F10>                   <C-O>:x<CR>
    nmap        <F7>                    :Next<CR>
    nmap        <F8>                    :next<CR>
    nmap        <Tab>                   <C-W><C-W>
    nmap        <Space>                 Lzt
    nmap        b                       Hz-

" ----------------------------------------------------------------------
" medium complexity mappings

    nmap        <Leader><F9>            :wall<CR>
    nmap        <Leader><F10>           :xall<CR>

    nmap        <C-\>q                  :se t_ti= t_te= <bar> q<CR>

    nmap        \o                      <C-W>o

    nnoremap    <Leader>cd              :lcd %:h<CR>

    nnoremap    <silent> <C-L>          :noh<CR>:call clearmatches()<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
    " this was from tpope's sensible.vim, IIRC

    nnoremap    <c-n>                   :set number!<CR>

    nmap        \\                      zt

    nmap        \db                     :set diffopt+=iwhite<CR>
    nmap        \D                      :DiffOrig<CR>
                                command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis

    if &diff
        syncbind
        nnoremap [      [czzzv
        nnoremap ]      ]czzzv
        nnoremap do     do]c
        nnoremap dp     dp]c
        nmap     <F2>   :set wrap!<CR>:wincmd p<CR>:set wrap!<CR>:wincmd p<CR>
        exec("syntax off")
    endif
    set         diffopt+=vertical

    " CTRL-U in insert mode deletes a lot. Put an undo-point before it.
    inoremap <C-u> <C-g>u<C-u>
    " https://sharats.me/posts/automating-the-vim-workplace/

" ----------------------------------------------------------------------
" complex mappings, commands, etc
"
" load files whose names contain string; usage:
"   :VD bar
    command! -nargs=1 VD n `find -L .  -name .git -prune -o -name .cache -prune -o -type f -print \| grep -i <args>`

" load files containing string
"
" NEW!! cursor on word, hit \ then '#' to find all occurrences of word in a heading
    nnoremap    \#                      :let @/=expand("<cword>")<CR>:silent grep ^\#.*<C-R>/<CR>:silent redraw!<CR>
" cursor on word, hit \ then '*' to find all occurrences of word
    nnoremap    \*                      :let @/=expand("<cword>")<CR>:silent grep -w <C-R>/<CR>:silent redraw!<CR>
" search pattern already set (perhaps by '/foo'), then hit \ then /
    nnoremap    \/                      :                             silent grep    <C-R>/<CR>:silent redraw!<CR>
" visually select some text, then hit \ then /
    vnoremap    \/                      "vy:let @/=@v<CR>:            silent grep  '<C-R>/'<CR>:silent redraw!<CR>
" explicitly specify word, example: ':VG foo'

    command! -nargs=* -bang VG :call VG(<bang>0, <f-args>)
    function! VG(buffers, patt, ...)
        let     @/ = a:patt

        if a:buffers
            " 'VG!' searches buffers instead of files
            " TODO may need to quote a:1 in some way but for now let's not worry about it
            call setqflist([])
            exe 'silent! bufdo grepadd ' . a:patt . ' %'
            copen
            return
        endif

        let     @/ = a:patt
        " do we really need this anymore?
        " let     cmd = join(a:000, "\n")
        " let     cmd = substitute(cmd, " ", "\\\\ ", "g")
        " let     cmd = substitute(cmd, "\n", " ", "g")
        let     cmd = "grep " . a:patt . " " . join(a:000, " ")
        silent  exec cmd
        set     hls
        set     nowrap
        redraw!
    endfunction

    " vanilla default if not overridden later
    set grepprg=grep\ -HRin

    " au StdinReadPost * set buftype=nofile

" ----------------------------------------------------------------------
" quickfix lists

    augroup qf
        au!

        " global autocommands for qf, including ][ maps
        au  filetype                qf          nnoremap [ :cprevious<CR>zv| nnoremap ] :cnext<CR>zv
        au  filetype                qf          set statusline=%!MSL()
        au  QuickFixCmdPost         *grep*      cwindow

    augroup END

" ----------------------------------------------------------------------
" highlights, colors, etc

    " highlighting multiple strings on screen (3 highlights hardcoded)
    hi          Myh1                    ctermbg=DarkMagenta     guibg=DarkMagenta
    hi          Myh2                    ctermbg=DarkGreen       guibg=DarkGreen
    hi          Myh3                    ctermbg=DarkCyan        guibg=DarkCyan
    hi          Myh4                    cterm=reverse           gui=reverse
    hi          Myhc                    ctermbg=Blue            guibg=Blue
    nmap        \h1                     :let h1=matchadd("Myh1", expand("<cword>"))<CR>
    nmap        \h2                     :let h2=matchadd("Myh2", expand("<cword>"))<CR>
    nmap        \h3                     :let h3=matchadd("Myh3", expand("<cword>"))<CR>
    nmap        <F4>                    :let h4=matchadd("Myh4", expand("<cword>"))<CR>
    nmap        \hc                     :let hc=matchadd("Myhc", "\\%".col(".")."c")<CR>
    nmap        \hr                     :let hr=matchadd("Myhc", @/)<CR>
    nmap        \h0                     :let h0=clearmatches()<CR>
    vmap        <F1>                    "hy:let h1=matchadd("Myh1", @h)<CR>
    vmap        <F2>                    "hy:let h2=matchadd("Myh2", @h)<CR>
    vmap        <F3>                    "hy:let h3=matchadd("Myh3", @h)<CR>
    vmap        <F4>                    "hy:let h4=matchadd("Myh4", @h)<CR>
    nnoremap    <bar>                   :set hls<CR>:exec "let @/='\\%".col(".")."c'"<CR>

    " colors, fonts, and general appearance
    hi      CursorLine      guibg=NONE      cterm=NONE
    hi      CursorLineNr    guibg=blue      ctermbg=4
    set     cursorline
    hi      Search          ctermbg=2       guibg=green

" ----------------------------------------------------------------------
" statusline

    hi User1 cterm=none ctermfg=black ctermbg=yellow    guifg=black guibg=yellow
    hi User2 cterm=none ctermfg=black ctermbg=red       guifg=black guibg=red
    hi User3 cterm=bold ctermfg=white ctermbg=darkblue  guifg=white guibg=darkblue

    hi User9 cterm=bold ctermfg=white ctermbg=black     guifg=white guibg=black

    hi StatusLineNC cterm=none

    let s:gitbranch = ''
    augroup getgitbranch
        au!
        au BufWinEnter  * let s:gitbranch = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
        " this is to avoid running git rev-parse too often
    augroup END

    function! MSL() abort
        let msl = ''

        if &paste                       | let msl = msl . '%2*[PASTE]%* '                           | endif
        let                                   msl = msl . '%3*%f%*%a%(%2*%m%*%)'
        if strlen(s:gitbranch) > 0      | let msl = msl . ' %1*' . s:gitbranch . '%*'               | endif
        let                                   msl = msl . ' %2*%r%w%q%*'
        if !empty(&key)                 | let msl = msl . '%2*[' . &cryptmethod . ']%*'             | endif
        if &spell                       | let msl = msl . '[spell]'                                 | endif
        if &fileformat != 'unix'        | let msl = msl . '%2*[' . &fileformat . ']%*'              | endif
        let                                   msl = msl . '[' . &fileencoding . ']' . '%1*%y%*'

        " right align from here
        let msl = msl . '%= %8(%c%V%) %3*%6l / %6L (%p%%)'

        " finally!
        return msl
    endfunction
    set statusline=%!MSL()

" ----------------------------------------------------------------------
" a few bits and pieces from https://github.com/tpope/vim-sensible

    " Lowering this improves performance in files with long lines.
    set synmaxcol=500

    set autoread

    " Allow color schemes to do bright colors without forcing bold.
    if &t_Co == 8 && $TERM !~# '^Eterm'
      set t_Co=16
    endif

    " <C-G>u is apparently 'break undo sequence'.  Do we need this?
    " if empty(mapcheck('<C-U>', 'i'))
    "   inoremap <C-U> <C-G>u<C-U>
    " endif
    " if empty(mapcheck('<C-W>', 'i'))
    "   inoremap <C-W> <C-G>u<C-W>
    " endif

" ----------------------------------------------------------------------
" stuff that is conditional on something

    if !isdirectory($HOME . '/.cache/vim')
        call mkdir( $HOME . '/.cache/vim/undo', 'p', 0700 )
    endif

    if has("persistent_undo")
        set undofile
        set undodir=~/.cache/vim/undo
    endif

