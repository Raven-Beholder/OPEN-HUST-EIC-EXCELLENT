#题目： 编写子程序 PENO(&X, N, SP, SN)
#求长度为 N 的字类型数组 X 中所有正奇数的和与所有负偶数的和
#并分别保存到 SP 和 SN 中
#已知 
#$a0 保存 X 地址
#$a1 保存数组长度 N
#正奇数的和保存在 $v0，负偶数的和保存在 $v1 中
#并编写主程序验证子程序功能。

################################################################
################################################################


.data
    msg1:.asciiz "\n The sum of the positive odd values = "
    msg2:.asciiz "\n The sum of the negative even values = "
    array1: .word 1,-4,8,-9,5,6,-10,19,22,23
    #Answer: posi-od = 48 nega-ev =-14
    array2: .word 121,-124,138,-199,255,2566,-1034,1019,2032,2033

    .globl main
.text

main:
    li $v0,4   #打印提示字符串1
    la $a0,msg1
    syscall #
    la $a0,array1
    li $a1,10

    jal peno

    move $a0,$v0
    li $v0,1
    syscall

    li $v0,4#打印提示字符串2
    la $a0,msg2
    syscall #

    move $a0,$v1
    li $v0,1
    syscall

    li $v0,4# 执行第二遍 打印提示字符串1
    la $a0,msg1
    syscall
    la $a0,array2
    li $a1,10

    jal peno

    move $a0,$v0
    li $v0,1
    syscall
    li $v0,4#打印提示字符串2
    la $a0,msg2
    syscall #

    move $a0,$v1
    li $v0,1
    syscall

    li $v0,10 #退出
    syscall
    
peno:
    addi	$v0, $0, 0			# $vo = $0 + 0 正奇数的和，声明变量
    addi	$v1, $0, 0			# $v1 = $0 + 0 副偶数的和，声明变量
    addi	$t0, $0, 0			# $t0 = $0 + 0 用 $t0 存储数组下标i

    sum_loop:
        sll $t1, $t0, 2         # 用 $t1 存储相对位移 （左移两位，相当于乘以4） 
                                # $t1 = 4 * $t0
        add	$t1, $t1, $a0		# $t1 = $t1 + $a0(X的位置) 计算位置
                                # $t1 存储了 X[i]的地址

        lw $t2, 0($t1)		# 将X[i]装载到 $t2 中
        
        slt $t3, $0, $t2        # 判断0是否小于$t2，$t3表示T1或F0
        beq	$t3, $0, negative	# if $t2 < 0 then negative
        j positive              # else positive

    negative:                   # 是负数
    #用临时寄存器存储X[i]的值，然后将临时寄存器左移位右移位
    #如果相等 -> 偶数
    #如果不相等 -> 奇数

        sra	$t3, $t2, 1
        sll	$t3, $t3, 1

        sub	$t4, $t3, $t2		# $t4 = $t3 - $t2
        bne	$0, $t4, next	    # if $0 == $t4 then next
                                # 如果等于零，为副奇数，结束

        add $v1, $v1, $t2       # 如果不为零，为副偶数，加一下再结束
        j next

    positive:                   # 是正数

        sra	$t3, $t2, 1
        sll	$t3, $t3, 1

        sub	$t4, $t3, $t2		# $t4 = $t3 - $t2
        beq	$0, $t4, next	    # if $0 != $t4 then next
                                # 如果等于零，为正偶数，结束

        add $v0, $v0, $t2       # 如果不为零，为正奇数，加一下再结束
        j next

    next:
        addi $t0, $t0, 1        #i=i+1
        bne $a1, $t0, sum_loop  #i != N时，继续循环
                                #i == N时，结束循环
    jr $ra