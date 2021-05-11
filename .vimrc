" Comments in Vimscript start with a `"`.

" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Map system keyboard to vim's paste buffer.
" set clipboard=unnamedplus

" Map leader key to a more reachable option namely space.
let mapleader = " "

" kitty fix
let &t_ut=''

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

"This line is to allow for previewing html in firefox
nnoremap <F5> :silent update<Bar>silent !firefox %:p:s?\(.\{-}/\)\{4}?http://localhost/?<CR>

" Whenever you start editing a file, Vim will try to figure out what kind of
" file this is.  When you edit "main.c", Vim will see the ".c" extension and
" recognize this as a "c" filetype.  When you edit a file that starts with
" "#!/bin/sh", Vim will recognize it as a "sh" filetype.
" The filetype detection is used for syntax highlighting and the other two
" items below.
" See |filetypes|.
" Filetype detection.

filetype plugin on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim file explorer configurations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => filetype
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set filetypes as typescriptreact
" autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim tiling controls
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" resize splits within arrow key
map <right> <C-W>>
map <up>    <C-W>+
map <down>  <C-W>-
map <left>  <C-W><


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Go to tab
" map <leader>t gt

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4 softtabstop=4

" 1 tab == 2 spaces when file type is html,js, or css
autocmd FileType yaml,typescriptreact,typescript,json,html,javascript,css,scss,tex setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set smartindent
set nu
set nowrap
set smartcase

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fillchars
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set empty space as vert vssplit seperator
set fillchars+=vert:\ 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto File Creation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'peterhoeg/vim-qml'
Plug 'edtsft/vim-qrc'
" latex plugin for vim
Plug 'lervag/vimtex'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'edkolev/tmuxline.vim'
" Plug 'ap/vim-css-color'
"Plug 'lilydjwg/colorizer'
"Plug 'dylanaraps/wal.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'maxmellon/vim-jsx-pretty'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-eunuch'
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'valloric/youcompleteme'
Plug 'w0rp/ale'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>e <ESC>:ALENextWrap<CR>
map <leader>E <ESC>:ALEPreviousWrap<CR>

map <leader>ta <ESC>:ALEToggle<CR>

map <leader>ll <ESC>:lopen<CR>
map <leader>cll <ESC>:lclose<CR>

map <leader>qf <ESC>:copen<CR>
map <leader>cqf <ESC>:cclose<CR>

map <leader>] <ESC>:ALEGoToDefinition<CR>

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

let g:ale_c_parse_compile_commands = 1
" let g:ale_c_always_make = 1

" let g:ale_linters_explicit = 1
" let g:ale_linters = {'typescriptreact': ['eslint']}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" 
" let g:syntastic_always_populate_loc_list = 1
" " let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_enable_signs = 1
" 
" map <leader>e <ESC>:lnext<CR>
" map <leader>E <ESC>:lprevious<CR>
" 
" map <leader>ll <ESC>:Errors<CR>
" map <leader>cll <ESC>:lclose<CR>
" 
" map <leader>st <ESC>:SyntasticToggleMode<CR>
" map <leader>sc <ESC>:SyntasticCheck<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fzf-config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>o <ESC>:FZF<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-airline-settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:airline_theme='base16_adwaita'
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimtex
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tex_flavor = 'latex'
let g:vimtex_context_pdf_viewer = 'zathura'
let g:vimtex_view_method = 'zathura'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Color
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set colorcolumn=80
set t_Co=256

" set colorscheme for compatibility with pywal tool
" colorscheme kikiDark

" set the color of the right column to 5
hi ColorColumn ctermbg=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FINDING FILES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set path+=**
"set wildignore+=**/node_modules/**

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tag Jumping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

command! MakeTags !ctags -R .
command! MakeNodeTags !ctags --exclude=.git --exclude=node_modules --exclude=package.json --exclude=package-lock.json --exclude=tsconfig.json -R .

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Formatting Macro
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <F3> <ESC>:Autoformat<CR>
command! FormatJson %!python -m json.tool

let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

let g:formatdef_my_custom_tex = '"latexindent"'
let g:formatters_tex = ['my_custom_tex']

let g:formatdef_my_custom_typescriptreact = '"prettier --parser typescript"'
let g:formatters_typescriptreact = ['my_custom_typescriptreact']

let g:formatdef_my_custom_cpp = '"clang-format"'
let g:formatters_cpp = ['my_custom_cpp']

" au BufWrite * :Autoformat

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Change the local/global Directory to Directory of Current file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command LCDC lcd %:p:h
command CDC cd %:p:h

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Instant Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Uncomment to override defaults:
"let g:instant_markdown_slow = 1
"let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_mermaid = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General shortuct commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command ViewColors :so $VIMRUNTIME/syntax/hitest.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Snippets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>html :-1read $HOME/.vim/.skeleton.html
nnoremap <leader>scss :-1read $HOME/.vim/.skeleton.scss
nnoremap <leader>js :-1read $HOME/.vim/.skeleton.js
nnoremap <leader>tex :-1read $HOME/.vim/.skeleton.tex
nnoremap <leader>py :-1read $HOME/.vim/.skeleton.py
nnoremap <leader>clang :-1read $HOME/.vim/.skeleton.c
nnoremap <leader>makefile :-1read $HOME/.vim/.skeleton.makefile
nnoremap <leader>tmuxpy :-1read $HOME/.vim/.tmux_py_project_skeleton.yml
nnoremap <leader>cpp :-1read $HOME/.vim/.skeleton.cpp
nnoremap <leader>makecpp :-1read $HOME/.vim/.skeleton.cpp.makefile
nnoremap <leader>giti :-1read $HOME/.vim/.skeleton.gitignore
nnoremap <leader>gitipy :-1read $HOME/.vim/.skeleton.py.gitignore


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => You Complete Me
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt=menuone
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_auto_hover = -1
" let g:ycm_show_diagnostics_ui = 0
" set python golbal config path
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
""let g:ycm_python_interpreter_path = '/usr/bin/python'
""let g:ycm_extra_conf_vim_data = [
""  \  'g:ycm_python_interpreter_path'
""  \]
""let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'

" let g:ycm_show_diagnostics_ui = 0
"
" Inorder to generate c++ config use YcmGenerateConfig

nmap <leader>D <plug>(YCMHover)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Statusline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#WildMenu#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %l:%c
set statusline+=\ 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showtabline=2
set tabline=%!MyTabLine()  " custom tab pages line
function! MyTabLine()
  let s = ''
  " loop through each tab page
  for i in range(tabpagenr('$'))
    if i + 1 == tabpagenr()
      let s .= '%#PmenuSel#'
    else
      let s .= '%#TabLine#'
    endif
    if i + 1 == tabpagenr()
      let s .= '%#PmenuSel#' " WildMenu
    else
      let s .= '%#Title#'
    endif
    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T '
    " set page number string
    let s .= i + 1 . ''
    " get buffer names and statuses
    let n = ''  " temp str for buf names
    let m = 0   " &modified counter
    let buflist = tabpagebuflist(i + 1)
    " loop through each buffer in a tab
    for b in buflist
      if getbufvar(b, "&buftype") == 'help'
        " let n .= '[H]' . fnamemodify(bufname(b), ':t:s/.txt$//')
      elseif getbufvar(b, "&buftype") == 'quickfix'
        " let n .= '[Q]'
      elseif getbufvar(b, "&modifiable")
        let n .= fnamemodify(bufname(b), ':t') . ', ' " pathshorten(bufname(b))
      endif
      if getbufvar(b, "&modified")
        let m += 1
      endif
    endfor
    " let n .= fnamemodify(bufname(buflist[tabpagewinnr(i + 1) - 1]), ':t')
    let n = substitute(n, ', $', '', '')
    " add modified label
    if m > 0
      let s .= '+'
      " let s .= '[' . m . '+]'
    endif
    if i + 1 == tabpagenr()
      let s .= ' %#PMenuSel#'
    else
      let s .= ' %#TabLine#'
    endif
    " add buffer names
    if n == ''
      let s.= '[New]'
    else
      let s .= n
    endif
    " switch to no underlining and add final space
    let s .= ' '
  endfor
  let s .= '%#Conceal#'
  " right-aligned close button
  " if tabpagenr('$') > 1
  "   let s .= '%=%#TabLineFill#%999Xclose'
  " endif
  return s
endfunction

