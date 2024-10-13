"### Plugins ###
call plug#begin('~/.nvim/plugged')
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'


" YouCompleteMe - Autocompletion
"Plug 'valloric/youcompleteme'
"let g:ycm_enable_diagnostic_signs = 0
"let g:ycm_enable_diagnostic_highlighting = 0
"let g:ycm_show_diagnostics_ui = 0
"let g:ycm_echo_current_diagnostic = 0
"let g:ycm_key_list_select_completion = ['<TAB>']
"let g:ycm_key_list_previous_completion = ['<S-TAB>']
"let g:ycm_key_list_stop_completion = ['<C-y>', '<Up>', '<Down>']
"let g:ycm_autoclose_preview_window_after_insertion = 1
"set splitbelow
"" Youcompleteme, close preview window automatically
"let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_autoclose_preview_window_after_completion = 1
"" Disable Youcompleteme with python
""let g:ycm_filetype_blacklist = {'python': 1}
""let g:yvm_semantic_triggers = {'python': []}

" Colorful Parenthesis
Plug 'luochen1990/rainbow'

""" HTML """
" Emmet
" * `,,` is the way to run command in insert-mode
" * HTML Boilerplate: `html:5,,''`
" * Create a tag: `div,,`, `p,,`, etc.
" * Child tags: `div>p>a,,` Will exapand to <div><p><a...
"   * To make many items in an item: `ul>li*5,,`
" * Use `.` for class and `#` for id: `div.container>p#foo>a,,`
Plug 'mattn/emmet-vim'
" Close tags via `>`
"   Use `>>` to put close tag on new line
Plug 'alvan/vim-closetag'

" Python-Mode
" * Run Code: <leader>r
" * Add/Remove Break Point: <leader>b
" * Search Documentation: <leader>K
" * HELP: `:help pymode`
Plug 'klen/python-mode'

" Grammar Check
" * To Run: `:GrammarousCheck`
" * Local mappings from the information window:
"   * Quit window: `q`
"   * Move to location of the error: `<Ctrl>`
"   * Fix the error automatically: `f`
"   * Mote to next/previous: `n`/`p`
Plug 'rhysd/vim-grammarous'


" Javascript
Plug 'pangloss/vim-javascript'

" Linter
Plug 'dense-analysis/ale'

" Go to next error with <leader>a
nmap <silent> <leader>a <Plug>(ale_next_wrap)

""" Coc.nvim (Auto Complete) """
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Find coc config files at: https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#implemented-coc-extensions

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'junegunn/fzf'

""" END COC """

""" Rust """
Plug 'neovim/nvim-lspconfig'


Plug 'rust-lang/rust.vim'
""""""

" Colorscheme
Plug 'crucerucalin/peaksea.vim'

" Status bar
"Plug 'vim-airline/vim-airline'

" Surround (TODO)
Plug 'tpope/vim-surround'

" Parenthesis
Plug 'chun-yang/auto-pairs'

" MRU Plugin - Most Recently Used files
" <leader>f to open recently used files search. 
"   Enter to open or "O" to open vertically split
Plug 'yegappan/mru'

" YankStack
" Use Ctrl+p and Ctrl+n to cycle through paste options
Plug 'maxbrunsfeld/vim-yankstack'

" BufExplorer - Find files in buffer
Plug 'jlanzarotta/bufexplorer'

" CTRL-P - Open files in buffer
Plug 'ctrlpvim/ctrlp.vim'

" snipMate (TODO, use for html tags)
"Plug 'msanders/snipmate.vim'

" Nerd tree - Show directories
Plug 'preservim/nerdtree'

" Vim-Multi-Cursors
"Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Lightline - Status line
Plug 'itchyny/lightline.vim'

" Show git changes
Plug 'airblade/vim-gitgutter'

" Fugitive - Git (Remove?)
Plug 'tpope/vim-fugitive'

" Universal Ctags - Helps neovim find ctags. Might need compiling: https://github.com/universal-ctags/ctags#how-to-build-and-install
Plug 'universal-ctags/ctags'
" Auto create/update Ctags
Plug 'ludovicchabant/vim-gutentags'

" Clang-format
Plug 'rhysd/vim-clang-format'

" Better C++ highlighting
Plug 'jackguo380/vim-lsp-cxx-highlight'

" Initialize plugin system
call plug#end()
