syntax on
call plug#begin()
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'ThePrimeagen/refactoring.nvim'
Plug 'tpope/vim-fugitive'
Plug 'glepnir/lspsaga.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'gruvbox-community/gruvbox'
Plug 'EdenEast/nightfox.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'coreyja/fzf.devicon.vim'
Plug 'safv12/andromeda.vim'
Plug 'sindrets/winshift.nvim'
Plug 'turbio/bracey.vim'
Plug 'sbdchd/neoformat'
Plug 'ghifarit53/tokyonight-vim'
call plug#end()

set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight
set background=dark " for the dark version
" set background=light " for the light version
set guicursor=
set termguicolors
set relativenumber
set number
set encoding=utf-8
set smarttab
set splitbelow
set splitright
set clipboard=unnamed
set laststatus=0
set scrolloff=5
" set textwidth=80
" set colorcolumn=+1
set backupdir=c:\tmp  " Do not clutter directory with swap
set directory=c:\tmp  " and temp files
set noundofile        " as well as undo files
set noerrorbells visualbell t_vb=
let g:netrw_liststyle=3
" set colorcolumn=80
let g:airline_powerline_fonts=1

" ConEmu conflict with Vim check out
" Github issue https://github.com/Maximus5/ConEmu/issues/641
inoremap <Char-0x07F> <BS>
nnoremap <Char-0x07F> <BS>

" Specify .md files as markdown
au BufRead,BufNewFile *.md setlocal ft=markdown

" Configure tabstop softtabstop and expand or not by filetype
if has("autocmd")
  filetype on

  autocmd FileType vim setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType elm setlocal ts=4 sts=4 sw=4 expandtab

  " These highlight lines that extend past 80 chars
  " autocmd BufEnter * highlight OverLength ctermbg=red guibg=#592929
  " autocmd BufEnter * match OverLength /\%>80v.\+/

  " Turn off bells
  autocmd GUIEnter * set visualbell t_vb=

endif

" Leader customization
let mapleader=" "
map <Leader>ptt :Dispatch py.test %<cr>
map <Leader>pta :Dispatch py.test<cr>
map <Leader>rss :Dispatch bundle exec rspec %<cr>
map <Leader>rsa :Dispatch bundle exec rspec ./spec<cr>
map <Leader>c :ccl<cr>
map <Leader>gs :Gstatus<cr>
map <Leader>gc :Gcommit<cr>
set backspace=indent,eol,start
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
nnoremap <C-j> :cnext<CR>zzzv
nnoremap <F8> :!browser-sync start --server --files .
nnoremap <C-p> :FZF<cr>
nnoremap ,m Vy
command! -nargs=0 Prettier :CocCommand prettier.formatFile
lua << EOF
require("winshift").setup({
  highlight_moving_win = true,  -- Highlight the window being moved
  focused_hl_group = "Visual",  -- The highlight group used for the moving window
  moving_win_options = {
    -- These are local options applied to the moving window while it's
    -- being moved. They are unset when you leave Win-Move mode.
    wrap = false,
    cursorline = false,
    cursorcolumn = false,
    colorcolumn = "",
  }
})
EOF
