set encoding=utf8
set fileencodings=utf8,iso-2022-jp,sjis,euc-jp

set langmenu=en_US.UTF-8

set number

set lines=60
set columns=80
set cmdheight=2

set noswapfile
" set nobackup
set autoindent

set history=50
set ruler
set incsearch
set wrapscan
"set nowrapscan

set expandtab
set tabstop=2
set shiftwidth=2

set showtabline=2
" set guioptions-=e
" set guioptions=e

if has('win32')
  set guifont=Consolas:h10
  set linespace=0
  set ambiwidth=double
  if has('printer')
    set printfont=MS_Mincho:h12
  end
elseif has('mac')
    set guifont="Migu 1M":h14
    "set guifont="MigMix 1P":h14
else
    " set guifont="Migu 1M":h14
    set guifontset=a14,r14,k14
endif

if &t_Co > 2 || has("gui_running")
  syntax on "set default color settings, and coloring for syntax
  "syntax enable "keep current color settings, and "coloring for syntax
  set hlsearch "emphasize match word
endif

colorscheme evening
highlight Normal guibg=#000066

filetype plugin indent on
" autocmd FileType text setlocal textwidth=78 "1 line of text file is shown 78 charactors.

set whichwrap=b,s,<,>,[,] "BS or <- to previous line, Space or -> to next line

set list "show Tab as ^I, and show EndLine as $
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:% "show Tab as >---, and blank at EndLine as -
highlight SpecialKey guifg=#aaaaaa "highlight for tab, trail, and so on.

set runtimepath+=~/Documents/textMemos/qfixapp
" let QFixWin_EnableMode = 1
let QFixHowm_Key = 'g'
let howm_dir             = '~/Documents/textMemos'
let howm_filename        = '%Y-%m-%d-%H%M%S.txt'
let howm_fileencoding    = 'utf-8'
let howm_fileformat      = 'unix'
"let QFixHowm_FileType = 'qfix_memo'
let QFixHowm_FileType = 'markdown'
"let QFixHowm_SaveTime = 2 "update timestamp at saved

set timeoutlen=3500 "timeout for mapping key

inoremap <expr> ,dt strftime("%Y/%m/%d %a")
" inoremap ,dt <C-R>=strftime("%Y/%m/%d %a")

set runtimepath+=~/vimfiles/bundle/neobundle.vim
call neobundle#begin(expand('~/vimfiles/bundle'))
" :NeoBundleInstall, :NeoBundleUpdate
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tyru/open-browser.vim'
call neobundle#end()

autocmd BufWinEnter,BufNewFile *.md set filetype=markdown
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
 \'type': 'markdown/kramdown',
 \'cmdopt': '--template ~/vimfiles/template_for_markdown.txt',
 \'outputter': 'browser'
\}
autocmd BufNewFile,BufRead *. {md,mdwn,mkd,mkdn,mark*} set filetype=markdown
autocmd FileType markdown hi! def link markdownItalic LineNr

set runtimepath+=$GOROOT/misc/vim
autocmd FileType go autocmd BufWritePre <buffer> Fmt

set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow

set modelines=0   " CVE-2007-2438

map <C-V>               "+gP
cmap <C-V>              <C-R>+
" For CTRL-V to work autoselect must be off.
" On Unix we have two selections, autoselect can be used.
if !has("unix")
  set guioptions-=a
endif

if has('lua')
  NeoBundle 'Shougo/neocomplete.vim'
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '¥*ku¥*'

  let g:neocomplete#sources#dictionary#dictionaries = {
      ¥ 'default' : '',
      ¥ 'vimshell' : $HOME.'/.vimshell_hist',
      ¥ 'scheme' : $HOME.'/.gosh_completions'
      ¥ }
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '¥h¥w*'

  inoremap <expr><C-g>  neocomplete#undo_completion()
  inoremap <expr><C-l>  neocomplete#complete_common_string()
endif

"auto save in 200msec without action, or at escaping from insert mode.
let g:auto_save = 1

