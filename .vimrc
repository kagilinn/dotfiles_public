scriptencoding utf-8
set encoding=utf-8
" vim: set tabstop=4 shiftwidth=4 noexpandtab :

"  2 移動、検索とパターン
set   autochdir
set nowrapscan
set   incsearch

"  4 テキストの表示
set nowrap
set   list
set listchars=tab:>\ ,trail:␣,eol:↲
set   number
set   hlsearch
set   cursorcolumn
set   cursorline

"  6 複数ウィンドウ
set laststatus=2

"  7 複数タブページ
set showtabline=2

" 12 メッセージと情報
set   showcmd
set   showmode
set   ruler
set novisualbell

" 13 テキスト選択
set   showmatch

" 15 タブとインデント
set tabstop=4
set shiftwidth=4
set nosmarttab
set noexpandtab
set   autoindent
set nosmartindent
set nocindent
set nolisp

" 19 ファイルの読み書き
set nobackup

" 22 外部コマンドの実行
"set shell=ksh

" 25 言語固有
set iminsert=0

" 26 マルチバイト文字
set fileencodings=ucs-bom,utf-8,cp932,default,latin1
set ambiwidth=double
set   emoji

" 単語の上で ctrl+k を押すと外部grep
nnoremap <C-k> :<C-u>grep '<C-r><C-w>'<CR><CR>
" Ctrl+] もカーソル位置の単語を外部grep (本来は ctags ジャンプ)
nnoremap <C-]> :<C-u>grep '<C-r><C-w>'<CR><CR>
" vimgrep or 外部grep 時に結果を別ペインに表示
autocmd QuickFixCmdPost *grep* cwindow
" 別ペインに表示した前後の検索結果を検索するキーバインド
nnoremap <C-n> :<C-u>cnext<CR>
nnoremap <C-p> :<C-u>cprevious<CR>

" -------------------------------------------------------------------------
" その他のキーバインド
" -------------------------------------------------------------------------
" 擬似スニペット
nnoremap <expr> <SPACE><SPACE> ':<C-u>r ~/.vim/snippets/' . &filetype . '/'

"--------------------------------------------------------------------------
" 内蔵ファイラ netrw の設定
"--------------------------------------------------------------------------
" Vim のカレントディレクトリに同期する
let g:netrw_keepdir=0
" 指定したパターンのファイルのみ表示
let g:netrw_hide=2
" パターンは「..」と非ドットファイル
let g:netrw_list_hide='^\.\.\/$,^[^.]'

"--------------------------------------------------------------------------
" ファイルタイプ別の設定を読み込む
"--------------------------------------------------------------------------
" .m は Objective-C と認識させる
let g:filetype_m = 'objc'

"--------------------------------------------------------------------------
" プラグイン管理
"--------------------------------------------------------------------------
packadd! editorconfig

"call plug#begin('~/.vim/plugged')
"Plug 'udalov/kotlin-vim'
"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'mattn/vim-lsp-settings'
"call plug#end()

"set omnifunc=lsp#complete

if filereadable(expand('~/.vimrc_grep.vim'))
	source ~/.vimrc_grep.vim
endif
if filereadable(expand('~/.vimrc_local.vim'))
	source ~/.vimrc_local.vim
endif

syntax on

" Local Variables:
" tab-width: 4
" indent-tabs-mode: t
" End:
