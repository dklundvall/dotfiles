call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
Plug 'mtdl9/vim-log-highlighting'
Plug 'pope/vim-surround'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neovim/termdebug'
Plug 'vimwiki/vimwiki'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
call plug#end()

"--------- LOOKS --------------"
colorscheme gruvbox
set background=dark
set relativenumber

"--------- COC ----------------"
let g:coc_snippet_next = '<tab>'
set statusline=%{coc#status()}
set updatetime=300

"--------- DEBUG ----------------"
let g:termdebug_popup = 0
let g:termdebug_wide = 163
" Some servers have issues with backup files
set nobackup
set nowritebackup

"------------- AG ----------------"
let g:ackprg = 'ag --nogroup --nocolor --column'

"------------- ALE ---------------"
let g:ale_fixers = {
		\ 'python':['autopep8', 'isort'],
		\ 'YAML' :['prettier'],
		\ 'cpp' :['clang-format'],
		\ 'c' :['clang-format']
		\}


let g:ale_linters = {
		\ 'python' : ['pylint'],
		\ 'YAML' : ['yamllint'],
		\ 'cpp': ['clang-tidy', 'clangd']
		\}

"--------- FUNCTIONS ----------"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Custom highlighting
function! MyHighlights() abort
    " Define BadWhitespace before using in a match
    highlight BadWhitespace ctermbg=red guibg=darkred

    " Highlight spelling mistakes in red
    highlight SpellBad cterm=underline ctermfg=red guifg=red

    " Do not use separate background color in sign column
    highlight SignColumn guibg=bg
    highlight SignColumn ctermbg=bg

    " Use underlined, bold, green for current tag
    highlight TagbarHighlight guifg=#b8bb26
    highlight TagbarHighlight gui=bold,underline

    " Highlight search results in bold green
    highlight Search guibg=guibg guifg=#b8bb26 gui=bold,underline cterm=bold,underline

    " Try to use more subdued colors in vimdiff mode
    highlight DiffAdd cterm=bold ctermfg=142 ctermbg=235 gui=NONE guifg=#b8bb26 guibg=#3c3c25
    highlight DiffChange cterm=bold ctermfg=108 ctermbg=235 gui=NONE guifg=#8ec07c guibg=#383228
    highlight DiffText cterm=NONE ctermfg=214 ctermbg=235 gui=NONE guifg=#fabd2f guibg=#483D28
    highlight DiffDelete cterm=bold ctermfg=167 ctermbg=235 gui=NONE guifg=#fb4934 guibg=#372827

    " Use Gruvbox colors for python semshi semantic highlighter
    hi semshiGlobal          ctermfg=167 guifg=#fb4934
    hi semshiImported        ctermfg=214 guifg=#fabd2f cterm=bold gui=bold
    hi semshiParameter       ctermfg=142  guifg=#98971a
    hi semshiParameterUnused ctermfg=106 guifg=#665c54
    hi semshiBuiltin         ctermfg=208 guifg=#fe8019
    hi semshiAttribute       ctermfg=108  guifg=fg
    hi semshiSelf            ctermfg=109 guifg=#85a598
    hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f
endfunction

function! Refactor()
	call inputsave()
	let @z=input("What do you want to rename '" . @z . "' to? ")
	call inputrestore()
endfunction

"--------- PYTHON -----------" 
autocmd FileType python call MyHighlights()
au BufNewFile,BufRead *.py set foldmethod=indent

"--------- KEYBINDINGS -----------" 
inoremap	<expr> 		<Tab>	pumvisible() ? 	"\<C-n>" : "\<Tab>"
inoremap 	<expr> 		<S-Tab> pumvisible() ? 	"\<C-p>" : "\<S-Tab>"
inoremap 	<expr> 		<cr> 	pumvisible() ? 	"\<C-y>" : "\<C-g>u\<CR>"
nnoremap 	<silent>	K 	:call <SID>show_documentation()<CR>
nnoremap	<space>		za
nnoremap	<C-j>		zj
nnoremap	<C-k>		zk
nnoremap	<C-ä>		:source $HOME/.config/nvim/init.vim<CR>
nmap 		<silent>  	gd 	<Plug>(coc-definition)
nnoremap	<C-n>		:NERDTreeToggle<CR>
nnoremap	<F10>		:ALEFix<CR>
nnorema		<C-h>		<C-w>h
nnorema		<C-j>		<C-w>j
nnorema		<C-k>		<C-w>k
nnorema		<C-l>		<C-w>l
" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>

" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>
let mapleader = "."
nmap 		rn		<Plug>(coc-rename)

nmap <Leader>rf "zyiw:call Refactor()<cr>mx:silent! norm gd<cr>[{V%:s/<C-R>//<c-r>z/g<cr>`x
