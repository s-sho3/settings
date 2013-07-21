set nocompatible "互換モードでは動作に制約があるのでオフ。pluginが動かなかったりするらしい。

set number "line number
"set no number
set autoindent

set history=50 "histories for commands and search

set ruler "show cursor position at right-bottom

set incsearch "show match strings in search
set wrapscan
"set nowrapscan

if &t_Co > 2 || has("gui_running")
  "Coloring is reset at colorscheme
	syntax on "set default color settings, and coloring for syntax
	"syntax enable "keep current color settings, and "coloring for syntax
  set hlsearch "emphasize match word
endif

colorscheme evening
highlight Normal guibg=#000066
"For solarize
"let g:solarized_contrast = 'high'
"let g:solarized_visibility = 'high'
"set background=dark
"colorscheme solarized

filetype plugin indent on "judge file type from file extension, the file type is used for emphasizing and indent.

autocmd FileType text setlocal textwidth=78 "1 line of text file is shown 78 charactors.

"set whichwrap=b,s "BS to previous line, Space to next line
"set whichwrap=b,s,<,> "BS or <- to previous line, Space or -> to next line
set whichwrap=b,s,<,>,[,] "BS or <- to previous line, Space or -> to next line

set list "show Tab as ^I, and show EndLine as $
set listchars=tab:>-,trail:- "show Tab as >---, and blank at EndLine as -
highlight SpecialKey guifg=#aaaaaa "highlight for tab, trail, and so on.

set noswapfile
set encoding=utf8
set fileencodings=utf8,iso-2022-jp,sjis,euc-jp

set lines=55
set columns=100
set linespace=0

set ambiwidth=double

set expandtab
set tabstop=2
set shiftwidth=2

set showtabline=2
set guioptions-=e

set guifont="Migu 1M":h14
"set guifont="MigMix 1P":h14

"source $VIMRUNTIME/mswin.vim
vnoremap <C-X> "+x "CTRL-X is Cut 
vnoremap <C-C> "+y " CTRL-C is Copy
" CTRL-V is Paste
map <C-V>               "+gP
cmap <C-V>              <C-R>+
" For CTRL-V to work autoselect must be off.
" On Unix we have two selections, autoselect can be used.
if !has("unix")
  set guioptions-=a
endif

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>           :update<CR>
vnoremap <C-S>          <C-C>:update<CR>
inoremap <C-S>          <C-O>:update<CR>
" CTRL-A is Select all
"noremap <C-A> gggH<C-O>G
"inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
"cnoremap <C-A> <C-C>gggH<C-O>G
"onoremap <C-A> <C-C>gggH<C-O>G
"snoremap <C-A> <C-C>gggH<C-O>G
"xnoremap <C-A> <C-C>ggVG
" CTRL-Tab is Next window
"noremap <C-Tab> <C-W>w
"inoremap <C-Tab> <C-O><C-W>w
"cnoremap <C-Tab> <C-C><C-W>w
"onoremap <C-Tab> <C-C><C-W>w

"source $VIMRUNTIME/delmenu.vim
"set langmenu=ja_JP.UTF-8 "set the language for menu
set langmenu=en_US.UTF-8
"source $VIMRUNTIME/menu.vim

if has("win32") "for Windows
  set guifont=Consolas:h10:cSHIFTJIS
	set ambiwidth=double
	set guifontwide=MS_Gothic:h10
	set linespace=0
	nnoremap <F6> :r!date/T<CR> "today
	"on Windows, need iconv.dll and intl.dll, for Japanese(set encoding=utf-8).
endif

" qfixappにruntimepathを通す(パスは環境に合わせてください)
set runtimepath+=~/Documents/textMemos/qfixapp

" キーマップリーダー
let QFixHowm_Key = 'g'

" howm_dirはファイルを保存したいディレクトリを設定
let howm_dir             = '~/Documents/textMemos'
let howm_filename        = '%Y-%m-%d-%H%M%S.txt'
let howm_fileencoding    = 'utf-8'
let howm_fileformat      = 'unix'
"let howm_fileformat      = 'dos'

"let QFixHowm_FileType = 'qfix_memo'
"let QFixHowm_FileType = 'markdown'
"let QFixHowm_SaveTime = 2 "update timestamp at saved

set timeoutlen=3500 "timeout for mapping key

"日付の入力補助
inoremap <expr> ,dt strftime('%b/%d/%Y(%a)')

if has('vim_starting')
	"set runtimepath+=c:/Users/XXX/vimfiles/neobundle.vim.git/
	"call neobundle#rc(expand('c:/Users/XXX/vimfiles/bundle'))
endif

NeoBundle 'https://github.com/Shougo/clang_complete.git'
"NeoBundle 'https://github.com/Shougo/echodoc.git'
NeoBundle 'https://github.com/Shougo/neocomplcache.git'
NeoBundle 'https://github.com/Shougo/neobundle.vim.git'
NeoBundle 'https://github.com/Shougo/unite.vim.git'
"NeoBundle 'https://github.com/Shougo/vim-vcs.git'
NeoBundle 'https://github.com/Shougo/vimfiler.git'
NeoBundle 'https://github.com/Shougo/vimshell.git'
NeoBundle 'https://github.com/Shougo/vinarise.git'

