# 使用方法

## 前往Conan的官网安装conan
如果安装后cmd输入conan -v 报错的话，需要设置conan的目录到系统环境变量

## 设置系统环境变量
CONAN_HOME=自定义你存储conan包的位置
我设置的是 Y:\lib\ConanDepot

## cmd运行
cmd运行do.bat
再输入包名指定文件，如 xxhash.txt
然后根据提示选择以哪种方式安装即可

PS：MD方式的安装是有问题的，目前我也只用到了MT方式
PS：我上传了一些示例

## 注意事项
第一次使用的话，需要先把“**conan profiles备份**”文件夹复制粘贴到**CONAN_HOM**目录中，并重命名为**profiles**

**生成的是适合VS使用的.props文件，在VS的属性管理器中，添加那个.props文件即可完成C++包的使用**


