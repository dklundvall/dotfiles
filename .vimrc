let mapleader="-"
set exrc
set secure
" Map Esc key
nmap qq <Esc>

set scrolloff=3
let &colorcolumn=80
nmap <C-n> :NERDTreeToggle<CR>
" Python settings

au BufNewFile, BufRead *.h, *.c 
	\ set filetype=c.doxygen
	\ set tabstop=4
	\ set softtabstop=4
	\ set shiftwidth=4
	\ set noexpandtab

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
	

" Lightline
let g:lightline = {
	\'colorscheme': 'gruvbox',
	\'active': {
	\	'left':	[['mode', 'paste'],
	\		[ 'gitbranch', 'readonly', 'filename', 'modified']]
	\},
	\'component_function': {
	\	'gitbranch': 'fugitive#heade'
	\},
	\}
let g:lightline.colorscheme = 'gruvbox'


" YCM Settings
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
set laststatus=2
set noshowmode
set number relativenumber

let g:pymode_python = 'python3'

" Patogen load
filetype off
execute pathogen#infect()
execute pathogen#helptags()
syntax on
filetype plugin indent on
let g:ale_completion_enabled = 1
let b:ale_fixers = ['autopep8','black', 'isort', 'yapf', 'pylint', 'add_blank_lines_for_python_control_statements' ]
let g:ale_fix_on_save = 1

" FzF
set rtp+=~/.fzf

function! s:find_root()
	for vcs in ['.git']
		let dir = finddir(vcs.'/..',';')
		if !empty(dir)
			execute 'FZF' dir
			return
		endif
	endfor
	FZF
endfunction

command! FZFR call s:find_root()
nmap <C-p> :FZFR<CR>

if &term =~# '256color' && ( &term =~# '^screen'  || &term =~# '^tmux' )
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif
