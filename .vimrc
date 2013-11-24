" ######################## neobundle #######################
set nocompatible               " Be iMproved
filetype off                   " Required!

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

filetype plugin indent on     " Required!

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif

" ######### plugins ########
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'teramako/jscomplete-vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'szw/vim-tags'
NeoBundle 'taichouchou2/alpaca_powertabline'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'taichouchou2/surround.vim'
NeoBundle 'open-browser.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'tell-k/vim-browsereload-mac'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim' }
" ######################## neobundle #######################

" ######################## neocomplcache #######################
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" ######################## neocomplcache #######################

" ######################## unite.vim #######################
"" unite.vim {{{
" The prefix key.
nnoremap    [unite]   <Nop>
noremap    <C-U><C-B> :Unite buffer<CR>
" noremap    <C-U><C-F> :UniteWithBufferDir -buffer-name=files file<CR>
noremap    <C-U><C-F> :Unite file<CR>
noremap    <C-U><C-R> :Unite file_mru<CR>
noremap    <C-U><C-Y> :Unite -buffer-name=register register<CR>
 
" unite.vim keymap
" https://github.com/alwei/dotfiles/blob/3760650625663f3b08f24bc75762ec843ca7e112/.vimrc
nnoremap [unite]u  :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]r :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> ,vr :UniteResume<CR>
 
" vinarise
let g:vinarise_enable_auto_detect = 1
" let g:unite_enable_start_insert=1
let g:unite_enable_split_vertically = 1 "縦分割で開く
let g:unite_winwidth = 50 "横幅50で開く
 
" unite-build map
nnoremap <silent> ,vb :Unite build<CR>
nnoremap <silent> ,vcb :Unite build:!<CR>
nnoremap <silent> ,vch :UniteBuildClearHighlight<CR>
"" }}}
" ######################## unite.vim #######################

" ######################## vim-javascript-syntax #######################
" au FileType javascript call JavaScriptFold()
" ######################## vim-javascript-syntax #######################

" ######################## jscomplete-vim #######################
autocmd FileType javascript
  \ :setl omnifunc=jscomplete#CompleteJS
let g:jscomplete_use = ['dom', 'moz', 'es6th']
" ######################## jscomplete-vim #######################

" ######################## syntastic #######################
let g:syntastic_javascript_checker = "jshint"
" ######################## syntastic #######################

" ######################## vim-tags #######################
au BufNewFile,BufRead *.php let g:vim_tags_project_tags_command = "ctags --languages=php -f ~/php.tags `pwd` 2>/dev/null &"
" ######################## vim-tags #######################

set hlsearch
set clipboard=unnamed,autoselect
set backspace=start,eol,indent
set laststatus=2
set statusline=%F%r%h%=
set expandtab
set smarttab
set number
set autoindent
set encoding=utf-8
set fileencodings=utf8,iso-2022-jp,euc-jp,sjis
set nocompatible "vi非互換モード
set et ts=4 sw=4 sts=4
autocmd FileType vim,sh,html,xhtml,javascript,coffee,ruby,eruby,scala,lua setlocal et ts=2 sw=2 sts=2

" +++++++++ set paste +++++++++ 
" 毎回 Insert を抜ける時に set nopaste する
autocmd InsertLeave * set nopaste
" +++++++++ set paste +++++++++ 

" +++++++++ vim-tags +++++++++ 
let g:vim_tags_project_tags_command = "/usr/local/Cellar/ctags/5.8/bin/ctags -f .tags -R {OPTIONS} {DIRECTORY} 2>/dev/null &"                                                                                                    
let g:vim_tags_gems_tags_command = "/usr/local/Cellar/ctags/5.8/bin/ctags -R -f .Gemfile.lock.tags `bundle show --paths` 2>/dev/null &"

set tags+=.tags
set tags+=.Gemfile.lock.tags
" +++++++++ vim-tags +++++++++ 

" ++++++++ color schema ++++++++
" colorscheme desert
" colorscheme zenburn
let g:solarized_termcolors=16
let g:solarized_termtrans=0
let g:solarized_degrade=0
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
let g:solarized_contrast='normal'
let g:solarized_visibility='normal'
syntax enable
set background=dark
colorscheme solarized
" ++++++++ color schema ++++++++

" ++++++++ customized emacs like key bind when it's in insert mode ++++++++
map <C-a> <Home>
map <C-e> <End>
imap <C-a> <Home>
imap <C-e> <End>
imap <C-f> <Right>
imap <C-b> <Left>
imap <C-p> <Up>
imap <C-n> <Down>
" ++++++++ customized emacs like key bind when it's in insert mode ++++++++
