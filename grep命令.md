打印包含关键字的行

`grep "root" test.txt`
打印以某个关键字开头的行

`grep "^root" test.txt`

打印某个关键字结尾的行

`grep "bash$" test.txt`

不区分大小写打印关键字的行

`grep -i "root" test.txt`

打印关键字并显示行号

`grep -n "root" test.txt`

递归搜索关键字，搜索所有的文件及目录，包含关键字的行

`grep -r "root" /home/back`

统计匹配关键字出现的次数

`grep -c "root" test.txt`

过滤空白行

`grep -v "^$" test.txt`

查找包含多个关键字的行

`grep -E "root|sync" test.txt`
