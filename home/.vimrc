set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup		" do not keep a backup file, use versions instead
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
nnoremap Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a


" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	 	\ | wincmd p | diffthis

set number
syntax on
noremap <F3> :up<ENTER>
noremap <F4> :tabnext<ENTER>
noremap <F5> :SyntasticCheck<ENTER>
noremap <F6> :lnext<ENTER>
noremap <F7> :source ~/.vim/session/work.session
noremap <F8> :mksession! ~/.vim/session/work.session

" auto insert , to end of line
nnoremap <c-j> <ESC>mzA,<ESC>`z
nnoremap <c-k> :lnext<ENTER>
nnoremap <c-l> :lprevious<ENTER>
nnoremap Zz :q!<ENTER>

set hlsearch
set shiftwidth=2
set tabstop=2
set encoding=utf-8
set fencs=utf-8,gbk,ucs-bom,gb18030,euc-jp,gb2312,cp936
" set fileencodings=ucs-bom,utf-8,utf-16le,cp1252,iso-8859-15
set fillchars+=stl:\ ,stlnc:\
set expandtab
color elflord
set fileformats=unix
set viminfo='200,%,!,<50,s10,h,rA,rB,/50,:50
set noignorecase

" set path+=./js,./view,./
" set suffixesadd+=.js
" set dict=./tags
" set complete+=k

set backup                  " Backups are nice ...
set undofile                " So is persistent undo ...
set undolevels=1000         " Maximum number of changes that can be undone
set undoreload=10000        " Maximum number lines to save for undo on a buffer reload

" set the runtime path to include Vundle and initialize
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'editorconfig/editorconfig-vim'

" fro syntax
Plugin 'isRuslan/vim-es6'
Plugin 'elzr/vim-json'
Plugin 'groenewege/vim-less'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-rails'
Plugin 'vim-scripts/nginx.vim'

" Plugin 'briancollins/vim-jst'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-markdown'

" for git
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-signify'

" for comment code
Plugin 'tpope/vim-commentary'

Plugin 'Lokaltog/vim-powerline'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-abolish'
Plugin 'digitaltoad/vim-pug'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'critiqjo/vsearch.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/sessionman.vim'
Plugin 'vim-scripts/restore_view.vim'
Plugin 'luochen1990/rainbow'
Plugin 'godlygeek/tabular' "用:或者=为基准使两边的文字对齐

" for autocomplete
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Shougo/neocomplete.vim'

" for syntastic check
Plugin 'scrooloose/syntastic'

call vundle#end()

filetype plugin indent on

" for git fugitive
if isdirectory(expand("~/.vim/bundle/vim-fugitive/"))
  set statusline+=%{fugitive#statusline()}
endif

let mapleader = ','

" for tabular
let g:tabular_loaded=1

" for rainbow
let g:rainbow_active=1

" for autocomplete
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsEnableSnipMate = 0
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" for syntastic check
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_javascript_checker = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint'
let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0

" for .js file could use jsx syntax
let g:jsx_ext_required=0

" for powerline
set laststatus=2   " Always show the statusline
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors

" copy from spf13
" 将swap, undo, backup, cursor在当前文件的保存位置的文件移到.vim文件夹中
function! InitializeDirectories()
    let parent = $HOME . '/.vim/'
    let dir_list = {
                \ 'backup': 'backupdir',
                \ 'views': 'viewdir',
                \ 'swap': 'directory' }

    if has('persistent_undo')
        let dir_list['undo'] = 'undodir'
    endif

    for [dirname, settingname] in items(dir_list)
        let directory = parent . '.' . dirname . '/'
        if exists("*mkdir")
            if !isdirectory(directory)
                call mkdir(directory)
            endif
        endif
        if !isdirectory(directory)
            echo "Warning: Unable to create backup directory: " . directory
            echo "Try: mkdir -p " . directory
        else
            let directory = substitute(directory, " ", "\\\\ ", "g")
            exec "set " . settingname . "=" . directory
        endif
    endfor
endfunction
call InitializeDirectories()

" open omnifunc, copy from spf13
if isdirectory($HOME . "/.vim/bundle/neocomplete.vim")
  let g:acp_enableAtStartup = 0
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#enable_auto_delimiter = 1
  let g:neocomplete#max_list = 15
  let g:neocomplete#force_overwrite_completefunc = 1


  " Define dictionary.
  let g:neocomplete#sources#dictionary#dictionaries = {
              \ 'default' : '',
              \ 'vimshell' : $HOME.'/.vimshell_hist',
              \ 'scheme' : $HOME.'/.gosh_completions'
              \ }

  " Define keyword.
  if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  " Plugin key-mappings {
      " These two lines conflict with the default digraph mapping of <C-K>
      if !exists('g:spf13_no_neosnippet_expand')
          imap <C-k> <Plug>(neosnippet_expand_or_jump)
          smap <C-k> <Plug>(neosnippet_expand_or_jump)
      endif
      if exists('g:spf13_noninvasive_completion')
          inoremap <CR> <CR>
          " <ESC> takes you out of insert mode
          inoremap <expr> <Esc>   pumvisible() ? "\<C-y>\<Esc>" : "\<Esc>"
          " <CR> accepts first, then sends the <CR>
          inoremap <expr> <CR>    pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
          " <Down> and <Up> cycle like <Tab> and <S-Tab>
          inoremap <expr> <Down>  pumvisible() ? "\<C-n>" : "\<Down>"
          inoremap <expr> <Up>    pumvisible() ? "\<C-p>" : "\<Up>"
          " Jump up and down the list
          inoremap <expr> <C-d>   pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
          inoremap <expr> <C-u>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"
      else
          " <C-k> Complete Snippet
          " <C-k> Jump to next snippet point
          imap <silent><expr><C-k> neosnippet#expandable() ?
                      \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
                      \ "\<C-e>" : "\<Plug>(neosnippet_expand_or_jump)")
          smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

          inoremap <expr><C-g> neocomplete#undo_completion()
          inoremap <expr><C-l> neocomplete#complete_common_string()
          "inoremap <expr><CR> neocomplete#complete_common_string()

          " <CR>: close popup
          " <s-CR>: close popup and save indent.
          inoremap <expr><s-CR> pumvisible() ? neocomplete#smart_close_popup()."\<CR>" : "\<CR>"

          function! CleverCr()
              if pumvisible()
                  if neosnippet#expandable()
                      let exp = "\<Plug>(neosnippet_expand)"
                      return exp . neocomplete#smart_close_popup()
                  else
                      return neocomplete#smart_close_popup()
                  endif
              else
                  return "\<CR>"
              endif
          endfunction

          " <CR> close popup and save indent or expand snippet
          imap <expr> <CR> CleverCr()
          " <C-h>, <BS>: close popup and delete backword char.
          inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
          inoremap <expr><C-y> neocomplete#smart_close_popup()
      endif
      " <TAB>: completion.
      inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
      inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

      " Courtesy of Matteo Cavalleri

      function! CleverTab()
          if pumvisible()
              return "\<C-n>"
          endif
          let substr = strpart(getline('.'), 0, col('.') - 1)
          let substr = matchstr(substr, '[^ \t]*$')
          if strlen(substr) == 0
              " nothing to match on empty string
              return "\<Tab>"
          else
              " existing text matching
              if neosnippet#expandable_or_jumpable()
                  return "\<Plug>(neosnippet_expand_or_jump)"
              else
                  return neocomplete#start_manual_complete()
              endif
          endif
      endfunction

      imap <expr> <Tab> CleverTab()
  " }

  " Enable heavy omni completion.
  if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
  endif
  let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
  let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
  let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
  let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
endif
