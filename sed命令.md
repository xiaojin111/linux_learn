### sed编辑器

(1) 一次从输入中读取一行数据。
(2) 根据所提供的编辑器命令匹配数据。
(3) 按照命令修改流中的数据。
(4) 将新的数据输出到STDOUT。

`sed options script file`

`echo "this is a test" | sed 's/test/big test/'`

在命令行使用多个编辑器命令

`sed -e 's/brown/green/;s/dog/cat/' data1.txt`

从文件中读取编辑器命令

```bash
s/brown/green/
s/fox/elephant/
s/dog/cat/
```

`sed -f script1.sed data1.txt`

#### 替换标记

`sed 's/test/trial/' data4.txt`

`s/pattern/replacement/flags`

有4种可用的替换标记：
 数字，表明新文本将替换第几处模式匹配的地方；
 g，表明新文本将会替换所有匹配的文本；
 p，表明原先行的内容要打印出来；
 w file，将替换的结果写到文件中

-n 只输出处理后的行，读入时不显示

输出所有内容

`sed -n 'p'/etc/passwd`

输出第6行内容

`sed -n '6p' /etc/passwd`

输出6~8行内容

`sed -n '6,8p' /etc/passwd`

输出所有奇数行

`sed -n 'p;n' /etc/passwd`

输出所有偶数行

`sed -n 'n;p' /etc/passwd`

输出1~10行中的偶数行

`sed -n '1,10{p;n}' /etc/passwd`

输出1~10行中的奇数行

`sed -n '1,10{n;p}' /etc/passwd`


#### 使用地址

当使用数字方式的行寻址时，可以用行在文本流中的行位置来引用。 sed编辑器会将文本流
中的第一行编号为1，然后继续按顺序为接下来的行分配行号。

`sed '2s/dog/cat/' data1.txt`

`sed '2,$s/dog/cat/' data1.txt`

组合命令

```bash
sed '2{
s/fox/elephant/
s/dog/cat/
}' data1.txt
sed '3,${
s/fox/elephant/
s/dog/cat/
}' data1.txt
```

#### 删除行

`sed 'd' data1.txt`

删除指定行

`sed '3d' data5.txt`

`sed '3,$d' data5.txt`

`sed '/number 1/d' data6.txt`

#### 修改行

```bash
sed '3c\
This is changed line of text' data.txt
```
