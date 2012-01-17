" Modeline and Notes {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
"	This is the personal .vimrc file of Steve Francia.
"	Peter Tseng has deleted everything that he does not understand and will
"	re-add things when necessary.
"	While much of it is beneficial for general use, I would
"	recommend picking out the parts you want and understand.
"
"	You can find me at http://spf13.com
" }

" Environment {
	" Basics {
		set background=dark     " Assume a dark background
	" }
" }

" General {
	set background=dark         " Assume a dark background
    "???
    filetype plugin indent on   "Auto detect file types ?does this require me to download something
    filetype plugin on
    "???
    "Answer: it will know what type of file you are editing so then it will help with formating!
	syntax on 					" syntax highlighting
	set mouse=a					" automatically enable mouse usage
	scriptencoding utf-8
	set virtualedit=onemore 	   	" allow for cursor beyond last character
	set history=1000  				" Store a ton of history (default is 20)
	set spell 		 	        	" spell checking on
	
	" Setting up the directories {
		set backup 						" backups are nice ...
        " Moved to function at bottom of the file
		"set backupdir=$HOME/.vimbackup//  " but not when they clog .
		"set directory=$HOME/.vimswap// 	" Same for swap files
		"set viewdir=$HOME/.vimviews// 	" same for view files
		
		"" Creating directories if they don't exist
		"silent execute '!mkdir -p $HVOME/.vimbackup'
		"silent execute '!mkdir -p $HOME/.vimswap'
		"silent execute '!mkdir -p $HOME/.vimviews'
	" }
" }

" Vim UI {
	color elflord " load a colorscheme
	set tabpagemax=10" only show 10 tabs
	set showmode                   	" display the current mode

	set cursorline  				" highlight current line
	hi cursorline guibg=#333333 	" highlight bg color of current line
	hi CursorColumn guibg=#333333   " highlight cursor

""The following ruler and status line have no discernible effect on my vim configuration
    set ruler                   " show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) "a ruler on steriods
    set showcmd
    
    set laststatus=2
    set statusline=%<%f\    " Filename
    set statusline+=%w%h%m%r " Options
    set statusline+=%{fugitive#statusline()} "  Git Hotness <-- Fugitive has
    set statusline+=\ [%{&ff}/%Y]            " filetype
    set statusline+=\ [%{getcwd()}]          " current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
""The above ruler and status line have no discernible effect

    set backspace=indent,eol,start
    set linespace=0                 " backspace for dummies
	set nu							" Line numbers on
	set showmatch					" show matching brackets/parenthesis
	set incsearch					" find as you type search
	set hlsearch					" highlight search terms
	set ignorecase					" case insensitive search
	set wildmenu					" show list instead of just completing
	set wildmode=list:longest,full	" command <Tab> completion, list matches, then longest common part, then all.
	set scrolloff=3 				" minimum lines to keep above and below cursor
    set list
    set listchars=tab:>.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace


" }

" Formatting {
	set nowrap                     	" wrap long lines
	set autoindent                 	" indent at the same level of the previous line
	set shiftwidth=4               	" use indents of 4 spaces
	set expandtab 	  	     		" tabs are spaces, not tabs
	set tabstop=4 					" an indentation every four columns
	set softtabstop=4 				" let backspace delete indent
	set pastetoggle=<F12>          	" pastetoggle (sane indentation on pastes)
" }

" Key (re)Mappings {

	"The default leader is '\', but many people prefer ',' as it's in a standard
	"location
	let mapleader = ','

    " Making it so ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
    nnoremap ; :


	" Easier moving in tabs and windows - Peter's comment: I don't know how to
    " use tabs yet..
	"map <C-J> <C-W>j<C-W>_
	"map <C-K> <C-W>k<C-W>_
	"map <C-L> <C-W>l<C-W>_
	"map <C-H> <C-W>h<C-W>_
	
    " Wrapped lines goes down/up to next row, rather than next line in file.
    nnoremap j gj
    nnoremap k gk

	" Stupid shift key fixes
	cmap W w 						
	cmap WQ wq
	cmap wQ wq
	cmap Q q
	cmap Tabe tabe

	" Yank from the cursor to the end of the line, to be consistent with C and D.
	nnoremap Y y$
		
    
    "clearing highlighted search
    nmap <silent> <leader>/ :nohlsearch<CR>

	" Shortcuts
	" Change Working Directory to that of the current file
    cmap cwd lcd %:p:h
	cmap cd. lcd %:p:h

	" visual shifting (does not exit Visual mode)
    vnoremap < <gv
	vnoremap > >gv 

	" Fix home and end keybindings for screen, particularly on mac
	" - for some reason this fixes the arrow keys too. huh.
	map [F $
	imap [F $
	map [H g0
	imap [H g0
		
" }

" Plugins {
" TODO: introduce slowly...haha
" Pathogen
    call pathogen#infect()
    call pathogen#helptags()
" }
