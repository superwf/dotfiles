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
call plug#begin('~/.nvim/bundle')
Plug 'editorconfig/editorconfig-vim'

" syntax all in one
Plug 'sheerun/vim-polyglot'
" syntax

" Plug 'elzr/vim-json'
" Plug 'groenewege/vim-less'
" Plug 'hail2u/vim-css3-syntax'
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
" Plug 'digitaltoad/vim-pug' " for jade template file
" Plug 'chr4/nginx.vim'
" Plug 'posva/vim-vue'
" Plug 'dart-lang/dart-vim-plugin'
" Plug 'kchmck/vim-coffee-script'
" Plug 'tpope/vim-markdown'
" Plug 'leafgarland/typescript-vim'
" Plug 'HerringtonDarkholme/yats.vim' " yet another ts syntax

" for git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " open browser to view git file
Plug 'mhinz/vim-signify' " show git diff status on sider

" for comment code
Plug 'tpope/vim-commentary'

Plug 'alvan/vim-closetag'
Plug 'vim-airline/vim-airline' " show many vim status at bottom bar
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs' "Insert or delete brackets, parens, quotes in pair.
Plug 'gcmt/wildfire.vim' "use ENTER to select code in block
" Plug 'kana/vim-textobj-user' 
" Plug 'kana/vim-textobj-indent' " vii dai yai cii
Plug 'tpope/vim-surround' "replace surround pairs
Plug 'tpope/vim-abolish' "easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-projectionist' " project file jump
" Plug 'junegunn/vim-easy-align' " from prettier exists, easy align no use anymore
Plug 'critiqjo/vsearch.vim' " search the word which is selected
" Plug 'vim-scripts/matchit.zip' " vim could jump between pairs without it, may by this function is already built-in.
" Plug 'luochen1990/rainbow' " trouble with javascript new line indent
Plug 'kien/rainbow_parentheses.vim' " colorful parentheses
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fast search by file path name
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-obsession' " use :Obsession start session
Plug 'terryma/vim-multiple-cursors'
" https://github.com/terryma/vim-multiple-cursors

" for autocomplete
Plug 'SirVer/ultisnips' " UltiSnips is the ultimate solution for snippets in Vim. It has tons of features and is very fast.
Plug 'honza/vim-snippets' " use togather with ultisnips
Plug 'isRuslan/vim-es6' " for js snippets
Plug 'Galooshi/vim-import-js' " [c-i] for auto import js package
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Dark powered asynchronous completion framework for neovim/Vim8<Paste>
" Plug 'Shougo/neco-vim' "The vim source for neocomplete/deoplete
" Plug 'Shougo/vimproc.vim', {
" \ 'build' : {
" \     'windows' : 'tools\\update-dll-mingw',
" \     'cygwin' : 'make -f make_cygwin.mak',
" \     'mac' : 'make -f make_mac.mak',
" \     'linux' : 'make',
" \     'unix' : 'gmake',
" \    },
" \ }
if has('win32') || has('win64')
  Plug 'tbodt/deoplete-tabnine', { 'do': 'powershell.exe .\install.ps1' }
else
  Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
endif

" for syntastic check
Plug 'dense-analysis/ale'

" markdown 
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" show marks
Plug 'kshenoy/vim-signature' " show marks in sider

" many many colorschemes all in this
Plug 'flazz/vim-colorschemes'

" Plug 'chrisbra/Colorizer'

call plug#end()


highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual

" set cursor color on paren
" https://stackoverflow.com/questions/10746750/set-vim-bracket-highlighting-colors
" color code see https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
hi MatchParen cterm=bold ctermbg=058 ctermfg=118
hi Visual ctermfg=118 ctermbg=241 gui=none

filetype plugin indent on

" for git fugitive
if isdirectory(expand("~/.nvim/bundle/vim-fugitive/"))
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
autocmd FileType typescript,typescript.tsx
       \ call deoplete#custom#buffer_option('auto_complete', v:false)
autocmd FileType less,css,html,javascript,scss,dart
       \ call deoplete#custom#buffer_option('auto_complete', v:true)
" let g:deoplete#auto_complete_delay = 300
augroup FiletypeGroup
  autocmd!
  au BufNewFile,BufRead *.tsx set filetype=typescript.tsx
augroup END

" for .js file could use jsx syntax
let g:jsx_ext_required=0

" for airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2   " Always show the statusline

let g:EditorConfig_exec_path = '/usr/bin/editorconfig'

" copy from spf13
" move swap, undo, backup, directory to ~/.nvim
function! InitializeDirectories()
    let parent = $HOME . '/.nvim/'
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

"'typescript': ['tsserver', 'eslint'],
" for ale syntax checker
let g:ale_linters = {
\   'html': ['prettier'],
\   'less': ['stylelint'],
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'eslint'],
\   'markdown': ['markdownlint'],
\   'json': ['prettier'],
\   'dart': ['dartanalyzer', 'language_server'],
\   'rust': ['cargo'],
\}
let g:ale_fixers = {
\   'html': ['prettier'],
\   'json': ['prettier'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'scss': ['stylelint'],
\   'css': ['stylelint'],
\   'less': ['stylelint'],
\   'dart': ['dartfmt'],
\   'rust': ['rustfmt'],
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

" check rust syntax
let g:ale_rust_cargo_use_check = 1
let g:ale_rust_cargo_check_tests = 1
let g:ale_rust_cargo_check_examples = 1

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

" onen syntax highlight and define colorscheme
syntax on
colorscheme gruvbox

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

" for Colorizer
" let g:colorizer_auto_filetype='css,less'
" let g:colorizer_skip_comments = 1
let g:github_enterprise_urls = ['http://git.jd.com']
