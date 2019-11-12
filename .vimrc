" vim-plug
call plug#begin('~/.vim/plugged')
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
" 屏幕内光标移动插件
Plug 'easymotion/vim-easymotion'
" 成对编辑插件 ds(删除) cs(修改) ys(增加)
Plug 'tpope/vim-surround'
" 多文件模糊搜索插件
" Files 文件路径 , 回车后输入文件名模糊搜索
" Ag 内容, 模糊搜索文件内容
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" 多文件搜索替换
" :Far foo bar **/*.py # 将foo替换bar, **/*.py指定了目录
" Fardo #执行替换操作
Plug 'brooth/far.vim'
" go插件
Plug 'fatih/vim-go'
" python插件
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
" 代码大纲插件 ,依赖于Universal-Ctags, 需要另行安装
" :TagbarToggle 命令, 打开代码大纲
Plug 'majutsushi/tagbar'
" 高亮单词插件, <leader>k 高亮当前词, <leader>K 取消所有高亮, N,
" n在高亮词中上下移动
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
" 设置在文件数中定位当前文件
nnoremap <leader>v :NERDTreeFind<cr>
" 显示\隐藏文件树的快捷键
nnoremap <leader>g :NERDTreeToggle<cr>
" 设置显示隐藏文件
let NERDTreeShowHidden=1
" 忽略一些文件不在文件数中显示
let NERDTreeIgnore = [
    \ '\.git$', '\.DS_Store$' 
    \]

" 定义文件搜索插件(Ctrl-P)的快捷键为Ctrl-P
let g:ctrlp_map = '<c-p>'

" 屏幕内移动光标插件设置
" 通过ss触发两字母搜索,之后符合输入的两字母的地方会重新标号,再次输入标号后可跳转
nmap ss <Plug>(easymotion-s2)

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

" tagbar配置
nnoremap <leader>t :TagbarToggle<CR>

" gutentags配置
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

