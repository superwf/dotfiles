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

set clipboard+=unnamedplus

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
" 	 	\ | wincmd p | diffthis

set number
noremap <F1> :w<ENTER>
noremap <F2> :w<ENTER>
noremap <F3> :FZF<ENTER>
" noremap <F4> :ALELint<ENTER>
noremap <F4> :CocDiagnostics<ENTER>
noremap <F5> :cprevious<ENTER>
noremap <F6> :cnext<ENTER>
noremap <F7> "+y
noremap <F8> :qa<ENTER>
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" imap <C-l> <Plug>(coc-snippets-expand)
" imap <C-o> <Plug>(coc-tsserver-expand)

imap <c-l> <Cmd>call codeium#CycleCompletions(1)<CR>
imap <c-o> <Cmd>call codeium#CycleCompletions(-1)<CR>

" auto insert ',' to end of line
nnoremap <c-j> <ESC>mzA,<ESC>`z
nmap <c-]> <Plug>(coc-definition)
nnoremap <c-h> :CocDiagnostics<ENTER>
nmap <c-k> <Plug>(coc-diagnostic-prev)
nmap <c-l> <Plug>(coc-diagnostic-next)
nnoremap <c-p> :call CocAction('pickColor')<ENTER>
nnoremap Zz :q<ENTER>
nnoremap Zw :w<ENTER>
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"nmap <silent> <c-c> :NextColorScheme<ENTER>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" add jsdoc comment surround
nmap dc ^i/**<ESC>A*/<ESC>

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
set termguicolors " for coc-highlight show color

set backup                  " Backups are nice ...
set undofile                " So is persistent undo ...
set undolevels=1000         " Maximum number of changes that can be undone
set undoreload=10000        " Maximum number lines to save for undo on a buffer reload

" set the runtime path to include Vundle and initialize
filetype off
call plug#begin('~/.nvim/bundle')
Plug 'Exafunction/codeium.vim'

" Plug 'github/copilot.vim'
Plug 'editorconfig/editorconfig-vim'

" syntax all in one
Plug 'sheerun/vim-polyglot'
" syntax
Plug 'antonk52/vim-browserslist'

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
Plug 'tpope/vim-surround' "replace surround pairs
Plug 'tpope/vim-abolish' "easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-projectionist' " project file jump
Plug 'critiqjo/vsearch.vim' " search the word which is selected
" Plug 'junegunn/rainbow_parentheses.vim' " colorful parentheses
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fast search by file path name
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-obsession' " use :Obsession start session
Plug 'terryma/vim-multiple-cursors'
" https://github.com/terryma/vim-multiple-cursors

" for syntastic check
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jparise/vim-graphql'

" markdown 
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" show marks
Plug 'kshenoy/vim-signature' " show marks in sider

" many many colorschemes all in this
Plug 'flazz/vim-colorschemes'
" preview colorscheme
" Plug 'xolox/vim-colorscheme-switcher' " when open this, use F8 tow switch colorscheme
" Plug 'xolox/vim-misc'

" Plug 'chrisbra/Colorizer' " replaced by coc-highlight

" copy clipboard image to markdown, need system install xclip first.
" Plug 'ferrine/md-img-paste.vim'

call plug#end()

" for ferrine/md-img-paste.vim
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>

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

" for .js file could use jsx syntax
let g:jsx_ext_required=0

" for airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_theme = 'badwolf'
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

set statusline+=%{LinterStatus()}

" fzf set
set rtp+=~/.fzf

" start for rainbow_parentheses

" Activation based on file type
" augroup rainbow_js
"   autocmd!
"   autocmd FileType typescript,javascript,scheme RainbowParentheses
" augroup END
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

autocmd CursorHold * silent call CocActionAsync('highlight')

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode

autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" for autoclose tags
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js,*.ts,*.tsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*.ts,*.tsx'
let g:closetag_xhtml_filetypes = 'xhtml,html'
let g:closetag_emptyTags_caseSensitive = 1

" au BufNewFile,BufRead *.ejs set filetype=javascript

let g:github_enterprise_urls = ['http://git.jd.com']

" use tab to expand snippets for coc-snippets
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'

set runtimepath^=~/.nvim/bundle/coc-eslint
