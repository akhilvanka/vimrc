call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'psliwka/vim-smoothie' 
Plug 'wellle/tmux-complete.vim'
Plug 'tpope/vim-fugitive'       
Plug 'sirver/ultisnips'
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim'
Plug '907th/vim-auto-save'

call plug#end()

set encoding=utf-8 
colorscheme noctu
set hidden
set wildmenu
set showcmd
set autoindent
set nostartofline
set confirm
set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start  
set visualbell
set t_vb=
set spelllang=en_us

set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

set nocursorline
set nocursorcolumn
set scrolljump=5
set lazyredraw
set redrawtime=10000
set synmaxcol=180
set re=1

hi NonText guifg=bg 

let loaded_netrw = 0  

let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

let g:coc_global_extensions = [
            \'coc-yank',
            \'coc-json',
            \'coc-css',
            \'coc-html',
            \'coc-tsserver',
            \'coc-yaml',
            \'coc-lists',
            \'coc-snippets',
            \'coc-pyright',
            \'coc-clangd',
            \'coc-prettier',
            \'coc-xml',
            \'coc-syntax',
            \'coc-git',
            \'coc-marketplace',
            \'coc-highlight',
            \]

let g:tmux_navigator_no_mappings = 1

"let g:UltiSnipsExpandTrigger = '<tab>'
"let g:UltiSnipsJumpForwardTrigger = '<tab>'
"let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

let g:tex_flavor='latex'

let &t_SI = "\e[4 q"
let &t_EI = "\e[2 q"

let g:auto_save_events = ["InsertLeave", "TextChanged", "TextChangedI"]

let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }


au FileType help wincmd L

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

let spellable = ['markdown', 'gitcommit', 'txt', 'text']
autocmd BufEnter * if index(spellable, &ft) < 0 | set nospell | else | set spell | endif

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif



function! s:list_all_files()
    call fzf#run(fzf#wrap({'source': 'ls'}))
endfunction

if has('filetype')
  filetype indent plugin on
endif

if has('syntax')
  syntax on
endif


inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
"nnoremap <leader>a :NERDTreeFocus<CR>
"nnoremap <C-d> :NERDTree<CR>
"nnoremap <C-g> :NERDTreeToggle<CR>
noremap <C-x> :call fzf#run(fzf#wrap({'source': 'ls'}))<CR>
noremap <leader>f :FZF<CR>
nnoremap <leader>w :AutoSaveToggle<CR>

noremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n"> :
      \ <SID>check_back_space() ? \"TAB>< :
      \ coc#refresh(")
inoremap <expr><S-TAB> pumvisible()) ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

nmap <leader>gd :Gdiffsplit<CR>
nmap <leader>gb :Gblame<CR>

