# SZTUBeamer

一个深圳技术大学幻灯片模板。

## 使用

使用下面的命令将模板克隆到你的项目：
```sh
git clone https://github.com/ikaroinory/SZTUBeamer.git
```

在LaTeX中使用模板：
```tex
\documentclass{SZTUBeamer}
```

还可以使用Beamer模板的参数，例如设置幻灯片比例为16:9：
```tex
\documentclass[aspectratio=169]{SZTUBeamer}
```

## 功能

### 类选项

- hidenav：隐藏导航栏
- bdi：显示大数据与互联网学院Logo
- cep：显示工程物理学院Logo
- cop：显示药学院Logo
- nmne：显示新材料与新能源学院Logo
- sgmi：显示中德智能制造学院Logo
- 兼容其他beamer类选项

### 命令

文档信息：

- `\title{<title>}`：设置标题
- `\institute{<institute>}`：设置所属机构
- `\author{<author>}`：设置作者
- `\supervisor{<supervisor>}`：设置指导者
- `\reportDate{<year>}{<month>}{<day>}`：设置报告日期

定制：

- `\authorPrefix{<prefix>}`：设置作者前缀，如`\authorPrefix{汇报人}\author{张三}`将显示`汇报人：张三`
- `\supervisorPrefix{<prefix>}`：设置指导者前缀，如`\supervisorPrefix{指导教师}\author{张三}`将显示`指导教师：张三`

页面：

- `\cover`：封面
- `\toc`：目录
- `\endpage[args]{[text]}`：显示附带Logo的结束页。可选参数：
    - `show`：显示作者和指导者

## 特别鸣谢

- [清华大学Beamer模板](https://github.com/tuna/THU-Beamer-Theme)
