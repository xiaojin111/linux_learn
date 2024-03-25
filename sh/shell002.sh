#!/bin/bash

echo ---------------------------------------------------------------------------------------------------------
echo "if-then语句"
# if语句后面的状态码是0表示成功，非0表示失败，fi 表示结束
if pwd
then
	echo "it worked"
fi
if grep "hello" test.txt
then
	echo this is my first command
fi
if grep "hello" test.txt
then
	echo "ok"
else
	echo "not ok"
fi
# test命令不写conditin部分，会以非零的退出状态码退出
if test
then
	echo "it worked"
else
	echo "it did not work"
fi

# 数值比较
if [ $value1 -gt 5 ]
then
	echo "value1 is greater than 5"
fi

# 字符串比较
if [ $var1 = $var2 ]
then
	echo "var1 is equal to var2"
fi
if [ $var1 \> $var2 ]
then
    echo "var1 is greater than var2"
fi
# 字符串是否有数据
if [ -n $var1 ]
then
    echo "var1 has data"
fi
if [ -z $var1 ]
then
    echo "var1 has data"
fi

# 文件比较
# 检查目录
echo 目录是否存在
jump_directory=/home/arthur
if [ -d $jump_directory ]
then
	echo "directory exists"
fi
# 检查对象是否存在, 文件，目录，链接
if [ -e $jump_directory ]
then
    echo "object exists"
fi

# 使用-f 比较文件是否存在
if [ -f $jump_directory ]
then
    echo "file exists"
fi
# 使用 -r 检查是否可读
if [ -r $jump_directory ]
then
    echo "file is readable"
fi

# 使用 -s 检查文件是否为空
if [ -s $jump_directory ]
then
    echo "file is not empty"
fi

# 使用 -x 检查文件是否可执行
if [ -x $jump_directory ]
then
    echo "file is executable"
fi

echo ---------------------------------------------------------------------------------------------------------
echo 复合条件测试
if [ -d $HOME ] && [ -w $HOME/xiaojin/a.txt ]
then
    echo "directory exists and is writable"
fi
echo 使用双括号进行高级数学表达式
var1=10
if (( $var1 ** 2 < 90 ))
then
    echo "it worked"
fi
echo 使用双方括号对字符串进行比较
if [[ $USER == r* ]]
then
    echo "it worked"
fi

echo ---------------------------------------------------------------------------------------------------------
echo "case语句"
case $USER in
    rich | barbara)
    echo "you are rich or barbara";;
    root)
    echo "you are root";;
esac






























