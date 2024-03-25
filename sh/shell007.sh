#!/bin/bash
echo 函数
echo ---------------------------------------------------------------------------------------------------------
echo 创建函数
function hello() {
}
echo 使用函数
function func1{
    echo "This is an example of a function."
}
count=1
while [ $count -le 5 ]
do
    func1
    count=$[ $count + 1 ]
done

echo ---------------------------------------------------------------------------------------------------------
echo 返回值，函数的退出状态码是函数中最后一条命令返回的退出状态码
func1(){
    ls -l badfile
}
func1
echo $?

echo 使用return命令 退出状态码必须是0~255
function db1{
    read -p "Enter a value:" value
    echo "doubling the value"
    return $[ $value * 2 ]
}
db1
echo $?

echo ---------------------------------------------------------------------------------------------------------
function addem {
    if [ $# -eq 0 ] || [ $# -gt 2 ]
    then
        echo -1
    elif [ $# -eq 1]
    then
        echo $[ $1 + $1 ]
    else
        echo $[ $1 + $2 ]
    fi
}
value=$(addem 10 14)

echo ---------------------------------------------------------------------------------------------------------
function testit{
    echo "The parameters are:$@"
}
myarray={1 2 3 4 5}
echo "The original array is : ${myarray[*]}}"
testit ${myarray[*]}

















