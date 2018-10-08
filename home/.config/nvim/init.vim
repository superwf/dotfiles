set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup		" do not keep a backup file, use versions instead
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
let mapleader = ','


" Don't use Ex mode, use Q for formatting
nnoremap Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a


" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
" 	 	\ | wincmd p | diffthis

set number
syntax on
noremap <F2> :w<ENTER>
noremap <F3> :FZF<ENTER>
noremap <F4> :ALELint<ENTER>
noremap <F5> :cprevious<ENTER>
noremap <F6> :cnext<ENTER>
noremap <F7> :source ./Session.vim<ENTER>
noremap <F8> :qa<ENTER>

" auto insert ',' to end of line
nnoremap <c-j> <ESC>mzA,<ESC>`z
nnoremap <c-k> :ALENext<ENTER>
nnoremap <c-l> :ALEPrevious<ENTER>
nnoremap <c-]> :ALEGoToDefinition<ENTER>
nnoremap Zz :q<ENTER>
nnoremap Zw :w<ENTER>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

set hlsearch
set shiftwidth=2
set tabstop=2
set encoding=utf-8 nobomb
set fencs=utf-8,gbk,ucs-bom,gb18030,euc-jp,gb2312,cp936
" set fileencodings=ucs-bom,utf-8,utf-16le,cp1252,iso-8859-15
set fillchars+=stl:\ ,stlnc:\
set expandtab
color elflord
set fileformats=unix
set viminfo='200,%,!,<50,s10,h,rA,rB,/50,:50
set noignorecase
set splitbelow " new window below
set splitright " new window right
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bin,.bbl,.blg,.brf,.cb,.dmg,.exe,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll " ignire these type of files
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
" set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/ckeditor/*,*/source_maps/*
set wildmenu " Hitting TAB in command mode will show possible completions above command line
set wildmode=list:longest " Complete only until point of ambiguity
set wrapscan " Searches wrap around end of file

set backup                  " Backups are nice ...
set undofile                " So is persistent undo ...
set undolevels=1000         " Maximum number of changes that can be undone
set undoreload=10000        " Maximum number lines to save for undo on a buffer reload

" set the runtime path to include Vundle and initialize
filetype off
" set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/bundle')
Plug 'editorconfig/editorconfig-vim'

" syntax
Plug 'isRuslan/vim-es6'
Plug 'elzr/vim-json'
Plug 'groenewege/vim-less'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'digitaltoad/vim-pug' " for jade template file
" Plug 'tpope/vim-rails'
Plug 'vim-scripts/nginx.vim'
Plug 'posva/vim-vue'

Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-markdown'
Plug 'leafgarland/typescript-vim'

" for git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" for comment code
Plug 'tpope/vim-commentary'


Plug 'bling/vim-airline'
" Plug 'bling/vim-bufferline'
Plug 'jiangmiao/auto-pairs'
Plug 'gcmt/wildfire.vim'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent' " vii dai yai cii
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-projectionist'
" Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'critiqjo/vsearch.vim'
" Plug 'vim-scripts/matchit.zip'
" Plug 'vim-scripts/sessionman.vim'
" Plug 'vim-scripts/restore_view.vim'
Plug 'luochen1990/rainbow' " trouble with javascript new line indent
Plug 'junegunn/fzf'
Plug 'tpope/vim-obsession'

" for autocomplete
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" for syntastic check
" Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'

Plug 'iamcco/markdown-preview.vim'

" show marks
Plug 'kshenoy/vim-signature'

" Plug 'prettier/vim-prettier'

call plug#end()

filetype plugin indent on

" for git fugitive
if isdirectory(expand("~/.vim/bundle/vim-fugitive/"))
  set statusline+=%{fugitive#statusline()}
endif

" for rainbow
let g:rainbow_active=1

" for autocomplete
let g:UltiSnipsExpandTrigger="<tab>"
if has('python')
  let g:UltiSnipsUsePythonVersion = 2
elseif has('python3')
  let g:UltiSnipsUsePythonVersion = 3
endif
let g:UltiSnipsEnableSnipMate = 0
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:deoplete#enable_at_startup = 1
" let g:deoplete#auto_complete_delay = 300

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" for syntastic check
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_enable_javascript_checker = 1
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exec = 'eslint'
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_error_symbol = '✗'
" let g:syntastic_warning_symbol = '⚠'
" let g:syntastic_scss_checkers = ['stylelint']
" let g:syntastic_enable_less_checker = 1
" let g:syntastic_less_checkers = ['css/stylelint']
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0

" for .js file could use jsx syntax
let g:jsx_ext_required=0

" for airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2   " Always show the statusline

let g:EditorConfig_exec_path = '/usr/bin/editorconfig'


" for session
set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
if isdirectory(expand("~/.vim/bundle/sessionman.vim/"))
    nmap <leader>sl :SessionList<CR>
    nmap <leader>ss :SessionSave<CR>
    nmap <leader>sc :SessionClose<CR>
endif

" for textobj-indent
" nmap <leader>ti <Plug>(textobj-indent-i)
" nmap <leader>ta <Plug>(textobj-indent-a)

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

" autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
autocmd FileType vue setlocal commentstring=//\ %s

" for ale syntax checker
let g:ale_linters = {
\   'html': ['tidy'],
\   'less': ['stylelint'],
\   'javascript': ['eslint'],
\   'typescript': ['tslint', 'tsserver'],
\}
let g:ale_fixers = {
\   'html': ['tidy'],
\   'json': ['prettier'],
\   'javascript': ['eslint', 'prettier'],
\   'typescript': ['prettier', 'tslint'],
\   'scss': ['prettier', 'stylelint'],
\   'css': ['prettier', 'stylelint'],
\   'less': ['prettier', 'stylelint'],
\}
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_lint_on_enter = 0
" let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_delay = 300
let g:ale_fix_delay = 300

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

set statusline=%{LinterStatus()}

" fzf set
set rtp+=~/.fzf
