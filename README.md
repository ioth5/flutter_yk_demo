# flutter学习



### 1.环境安装
```
cd $HOME
vim ~/.bash_profile
export PATH=/Users/ioth5/lxd/flutter/bin:$PATH
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
```
##### 执行并创建 bash_profile文件，添加flutter全局变量
```
R 热更新，有更改"R"可以直接刷新安卓程序
P 显示安卓网格
O 转换到IOS样式
Q 退出.
```
##### 1.踩坑
```
在执行export PATH=pwd/flutter/bin:$PATH命令的时候踩了坑，按教程执行完之后，
在命令行输入 flutter doctor之后仍然会提示找不到flutter这个命令。
```
##### 2.爬坑
```
这句命令是来为flutter设置环境变量的，这里要根据本机flutter sdk实际安装目录来设置。
例如，我这里flutter中bin文件夹的目录是/Users/my/flutter_sdk/flutter/bin
所以我们应该执行的，命令是：
export PATH=$PATH:/Users/my/flutter_sdk/flutter/bin

再次在命令行输入flutter doctor，就不会报找不到flutter命令的错误了。
```
##### 3.出坑
```
新建一个命令行窗口，再次输入flutter doctor，你会发现仍然报-bash: flutter: command not found这个错误。
这是因为我们之前设置环境变量的时候，是直接在命令行通过export命令进行的，并没有全局设置上。
这时候我们应该：
打开.bash_profile文件：open -e .bash_profile

在文件末尾设置追加设置flutter bin目录路径为环境变量：
```

#### 模拟器启动命令
```
1. open -a Simulator // 检测模拟器
2. flutter run 。    // 启动应用
3. flutter packages get // 初始化项目
```
##### flutter 布局（Flutter布局机制的核心就是widget）重点是什么?
###### 1.Widgets 是用于构建UI的类.
###### 2.Widgets 用于布局和UI元素.
###### 3.通过简单的widget来构建复杂的widget



## 2. flutter 包的安装与更新 https://flutterchina.club/using-packages/
```
1.flutter packages get
2.flutter packages upgrade // 升级到软件包的新版本
```
