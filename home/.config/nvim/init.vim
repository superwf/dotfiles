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
noremap <F7> "+y
noremap <F8> :qa<ENTER>

" auto insert ',' to end of line
nnoremap <c-j> <ESC>mzA,<ESC>`z
nnoremap <c-i> :ImportJSFix<ENTER>
nnoremap <c-k> :ALENext<ENTER>
nnoremap <c-l> :ALEPrevious<ENTER>
nnoremap <c-]> :ALEGoToDefinition<ENTER>
nnoremap <c-h> :ALEDetail<ENTER>
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
Plug 'chr4/nginx.vim'
Plug 'posva/vim-vue'
Plug 'alvan/vim-closetag'
Plug 'dart-lang/dart-vim-plugin'
" ALE的linter的language_server在nvim下不工作，只能用LanguageClient连接dart_language_server
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
" 下面这个与ale有冲突
" Plug 'roxma/nvim-completion-manager'

Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-markdown'
Plug 'leafgarland/typescript-vim'
" Plug 'HerringtonDarkholme/yats.vim'

" for git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" for comment code
Plug 'tpope/vim-commentary'


Plug 'bling/vim-airline'
" Plug 'bling/vim-bufferline'
Plug 'jiangmiao/auto-pairs'
Plug 'gcmt/wildfire.vim' "use ENTER to select code in block
" Plug 'kana/vim-textobj-user'
" Plug 'kana/vim-textobj-indent' " vii dai yai cii
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
" Plug 'luochen1990/rainbow' " trouble with javascript new line indent
Plug 'kien/rainbow_parentheses.vim'
Plug 'junegunn/fzf'
Plug 'tpope/vim-obsession'
Plug 'terryma/vim-multiple-cursors'

" for autocomplete
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Galooshi/vim-import-js'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'ternjs/tern_for_vim'
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'Shougo/neco-vim'
Plug 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

" for syntastic check
Plug 'w0rp/ale'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" show marks
Plug 'kshenoy/vim-signature'

" many many colorschemes all in this
Plug 'flazz/vim-colorschemes'

" code review
Plug 'junkblocker/patchreview-vim'
Plug 'codegram/vim-codereview'

call plug#end()

colorscheme molokai

" set cursor color on paren
" https://stackoverflow.com/questions/10746750/set-vim-bracket-highlighting-colors
" color code see https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
hi MatchParen cterm=bold ctermbg=058 ctermfg=118
hi Visual ctermfg=118 ctermbg=241 gui=none

filetype plugin indent on

" for git fugitive
if isdirectory(expand("~/.vim/bundle/vim-fugitive/"))
  set statusline+=%{fugitive#statusline()}
endif

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
autocmd FileType typescript,typescript.tsx,dart
       \ call deoplete#custom#buffer_option('auto_complete', v:false)
autocmd FileType less,css,html,javascript,scss
       \ call deoplete#custom#buffer_option('auto_complete', v:true)
" let g:deoplete#auto_complete_delay = 300

" 需要先安装 pub global activate dart_language_server
let g:LanguageClient_serverCommands = {
 \ 'dart': ['dart_language_server'],
 \ }
autocmd FileType dart
       \ LanguageClientStart

" for .js file could use jsx syntax
let g:jsx_ext_required=0

" for airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2   " Always show the statusline

let g:EditorConfig_exec_path = '/usr/bin/editorconfig'

" copy from spf13
" move swap, undo, backup, directory to ~/.vim
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
\   'typescript': ['tsserver'],
\   'markdown': ['markdownlint'],
\}

" 'dart': ['dartanalyzer', 'language_server'],
let g:ale_fixers = {
\   'html': ['prettier'],
\   'json': ['prettier'],
\   'javascript': ['eslint'],
\   'typescript': ['tslint', 'prettier'],
\   'scss': ['prettier', 'stylelint'],
\   'css': ['prettier', 'stylelint'],
\   'less': ['prettier', 'stylelint'],
\   'dart': ['dartfmt'],
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

" start for rainbow_parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['darkgreen',        'RoyalBlue3'],
    \ ['darkcyan',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au Syntax * RainbowParenthesesLoadChevrons
" end for rainbow_parentheses

" for terminal in neovim
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
  highlight! link TermCursor Cursor
  highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
  tnoremap <M-h> <c-\><c-n><c-w>h
  tnoremap <M-j> <c-\><c-n><c-w>j
  tnoremap <M-k> <c-\><c-n><c-w>k
  tnoremap <M-l> <c-\><c-n><c-w>l
endif

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" for autoclose tags
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,*.js'
au BufNewFile,BufRead *.ejs set filetype=javascript
