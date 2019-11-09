" vim-plug
call plug#begin('C:\Users\sxiny\AppData\Local\nvim\plugged')
" 要安装的脚本
" 修改启动界面
Plug 'mhinz/vim-startify'
" 状态栏美化
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" 增加代码缩进线
Plug 'yggdroot/indentline'
" 配色方案
Plug 'w0ng/vim-hybrid'
Plug 'tomasr/molokai'
" 目录树
Plug 'scrooloose/nerdtree'
" 文件搜索插件
Plug 'ctrlpvim/ctrlp.vim'
" 多文件模糊搜索插件
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" 多文件搜索替换
Plug 'brooth/far.vim'
" go插件
Plug 'fatih/vim-go'
" python插件
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
" 浏览代码插件
Plug 'majutsushi/tagbar'
" 高亮单词插件
Plug 'lfv89/vim-interestingwords'
" 括号匹配插件
Plug 'Raimondi/delimitMate'
" C++ 高亮插件
Plug 'octol/vim-cpp-enhanced-highlight'
" ctags自动生成插件
Plug 'ludovicchabant/vim-gutentags'

call plug#end()



" 打开行号显示
set nu	
" 设置tab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" 设置自动缩进
set autoindent
set cindent
" 设置主题
set background=dark
colorscheme hybrid  
syntax on
" 高亮搜索
set hlsearch	

let mapleader=','
"设置保存文件的快捷键
inoremap <leader>w <Esc>:w<cr>
noremap <leader>w :w<cr>

" 按下jj退出insert模式(jj在编辑时很少用到,故改为其他功能), `^保证退出insert模式后, 光标位置不变
inoremap jj <Esc>`^
" 切换窗口快捷键修改
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" 设置文件树
" 分别定义定位文件树, 启动文件树, 显示隐藏文件, 文件树忽略文件
nnoremap <leader>v :NERDTreeFind<cr>
nnoremap <leader>g :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
let NERDTreeIgnore = [
    \ '\.git$', '\.DS_Store$' 
    \]

" 定义文件搜索插件(Ctrl-P)的快捷键为Ctrl-P
let g:ctrlp_map = '<c-p>'

" Python插件设置
let g:pymode_python = 'python3'
" 保存时删除无用的空白符
let g:pymode_trim_whitespaces = 1
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
let g:pymode_rope_goto_definition_bind = "<C-]>"
let g:pymode_lint = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'pylint']
let g:pymode_options_max_line_length = 120

" C++高亮插件设置
let g:cpp_member_variable_highlight = 1

