## 安装
```
  wget http://github.com/mindpin/project_build_tools/raw/master/project_build_tools-0.0.1.gem
  gem install project_build_tools-0.0.1.gem
```
## 使用

```
  # 生成 sinatra 工程
  # 运行这个命令会在当前目录下创建 $project_name 目录
  pbtools sinatra $project_name

  # 启动 sinatra 工程
  cd $project_name
  bundle
  bundle exec rackup
```