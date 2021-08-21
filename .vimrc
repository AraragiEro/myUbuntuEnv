
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'" - Avoid using standard Vim directory names like 'plugin'
" 插件
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" 自动格式
Plug 'junegunn/vim-easy-align'

" 更强大的状态栏
Plug 'chrisbra/vim-airline'
Plug 'chrisbra/vim-airline-themes'
	let g:airline#extensions#tabline#enabled=1
	nnoremap <C-N> :bn<CR>
	nnoremap <C-P> :bp<CR>
	let g:airline_theme="luna"
	let g:airline_powerline_fonts=1 
  " unicode symbols
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = '☰'
  let g:airline_symbols.maxlinenr = ''
  let g:airline_symbols.dirty='⚡'



	" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'preservim/nerdtree'
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1

let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeWinSize=35
let g:nerdtree_tabs_open_on_console_startup=1


Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

Plug 'valloric/youcompleteme', { 'do': './install.py --clang-completer'}
let g:ycm_key_invoke_completion = '<c-z>'
let g:ycm_semantic_triggers = {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],}

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

Plug 'jiangmiao/auto-pairs'
" Initialize plugin system
call plug#end()



" Javascript syntax hightlight
syntax enable

" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile Appraisals set filetype=ruby
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd Syntax javascript set syntax=jquery

" Color scheme
colorscheme molokai
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

set nu
set tabstop=4
set softtabstop=4
set shiftwidth=4
set t_Co=256
set cursorline
highlight CursorLine   cterm=NONE ctermbg=237 ctermfg=NONE guibg=NONE guifg=NONE

