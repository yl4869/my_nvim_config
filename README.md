# 简介
参考 https://github.com/nshen/learn-neovim-lua 获得了配置方法  

# 用法  
解压，并放到~/.config/目录, 请确保你安装了neovim    

打开nvim，使用```:PackerSycn```安装所有插件.退出重新启动,程序将会自动安装已存在的lsp服务.

使用```:LspInstallInfo```可以让你查看安装进程  

# 注意
如果需要安装其他依赖，可以使用你的包管理器进行安装  
采用packer进行插件管理  
使用```:checkhealth```进行状态检查  

# 实现
采用packer进行插件管理
neovim 内置LSP服务(bash，c_cpp,cmake,letex,lua,rust,systemverilog/verilog)  
符号补全与自动缩进  
markdown扩展  
启动页  
一个好的主题配色  
致力于提供不亚于vscode的上手体验  



