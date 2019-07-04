"***********************************************************
"
"        File name       : .vimrc
"        Author          :
"
"***********************************************************


if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    "Plug 'junegunn/vim-easy-align'
call plug#end()


set nu
set hlsearch
set background=dark
set completeopt=menu

set foldenable
set foldlevel=3
set foldmethod=manual
set fileformats=unix,dos
set fileencodings=ucs-bom,utf-8,prc,taiwan,latin1
set expandtab
set shiftround
set autoindent
set shiftwidth=4
set softtabstop=4
set backspace=indent,eol,start

syntax enable
"loadview

inoremap <C-A> <Home>
inoremap <C-E> <End>
inoremap <C-B> <Left>
inoremap <C-J> <Down>
inoremap <C-K> <Up>
inoremap <C-L> <Right>

iab st <C-r>=strftime("%Y-%m-%d %H:%M:%S")<CR>

func DataInsert()
    call cursor(1,1)
    if search('Last Modified') != 0
        let line = line('.')
        if line > 20
            return
        endif
        exec line.'s/[0-9]\{4}-.*$/\=strftime("%Y-%m-%d %H:%M:%S")'
        "call setline(line, '"        Last Modified   : '.strftime("%Y-%m-%d %H:%M:%S"))
    endif
endfunc

autocmd FileWritePre,BufWritePre *.sh,*.h,*.c,*.cpp ks|call DataInsert()|'s

func SetComment_c()
    call setline(1,             "/***********************************************************")
    call append(line(".")+0,    "*")
    call append(line(".")+1,    "*        File name       : ".expand("%"))
    call append(line(".")+2,    "*        Author          : "."")
    call append(line(".")+3,    "*        Description     : "."---")
    call append(line(".")+4,    "*        Created         : ".strftime("%Y-%m-%d %H:%M:%S"))
    call append(line(".")+5,    "*        Last Modified   : ".strftime("%Y-%m-%d %H:%M:%S"))
    call append(line(".")+6,    "*")
    call append(line(".")+7,    "***********************************************************/")
    call append(line(".")+8,    "")
endfunc

func SetComment_sh()
    call setline(1,    "#! /bin/bash")
    call setline(2,    "")
    call setline(3,             "#***********************************************************")
    call cursor(3,1)
    call append(line(".")+0,    "#")
    call append(line(".")+1,    "#        File name       : ".expand("%"))
    call append(line(".")+2,    "#        Author          : "."")
    call append(line(".")+3,    "#        Description     : "."---")
    call append(line(".")+4,    "#        Created         : ".strftime("%Y-%m-%d %H:%M:%S"))
    call append(line(".")+5,    "#        Last Modified   : ".strftime("%Y-%m-%d %H:%M:%S"))
    call append(line(".")+6,    "#")
    call append(line(".")+7,    "#***********************************************************")
    call append(line(".")+8,    "")
endfunc

func SetComment()
    if expand("%:e") == "h"
        call SetComment_c()
    elseif expand("%:e") == "c"
        call SetComment_c()
    elseif expand("%:e") == "cpp"
        call SetComment_c()
    elseif expand("%:e") == "sh"
        call SetComment_sh()
    endif
endfunc

autocmd BufNewFile *.sh,*.h,*.c,*.cpp call SetComment()|normal G
