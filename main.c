//
//  main.c
//  Sum of Two Long Integers
//
//  Created by RavenChen on 2020/4/11.
//  Copyright © 2020 RavenChen. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#define RIGHT 1
#define WRONG 0

typedef struct node{
    int data;
    struct node *prior;
    struct node *next;
}DuLNode;

DuLNode *DuLCreate();/*通过顺序遍历，建立一个双向链表，data数据域存储数字*/
DuLNode *addition(DuLNode *a, DuLNode *b);/*加法运算
通过逆向遍历双向链表，模拟竖式加法的过程，并且在合适的位置进位*/
DuLNode *subtraction(DuLNode *a, DuLNode *b);/*减法运算
通过逆向遍历双向链表，模拟竖式减法的过程，并且在合适的位置退位*/
void printDuLNode(DuLNode *head);//顺序遍历输出结果，并且加上分隔符

DuLNode *DuLCreate()
{
    DuLNode *head,*p,*last = NULL;
    int Is_Legal = 1;
    char c;
    int num;
    int len = 0;
    head = (DuLNode*)malloc(sizeof(DuLNode));
    head->next = NULL;
    head->prior = NULL;
    head->data = 1;//存储数字长度，正号表示正数，负号表示负数
    while ((c=getchar()) != ';')
    {
        if (c=='-')
        {
            head->data = -1;
            continue;
        }
        
        if (c==',') continue;
        
        num = c -'0';//将字符值更改为数字值
        
        if(num>9 || num<0)
        {
            Is_Legal = WRONG;
            break;
        }
        
        p = (DuLNode*)malloc(sizeof(DuLNode));
        p->data = num;
        len ++;
        
        if (head->next == NULL)
        {
            head->next = p;
            p->prior = head;
            last = p;
        }else{
            p->prior = last;
            last->next = p;
            last = p;
        }//指针移动
        
        if(Is_Legal == WRONG) head->data = 0;
        else{
            last->next =NULL;
            head->prior = last;
        }
    }
    head->data = (head->data) * len;//修改1
    return head;
}

DuLNode *addition(DuLNode *a, DuLNode *b)
{
    int symbol = abs(a->data)/(a->data);//符号正负
    int len_a = abs(a->data);//数字 a 的长度
    int len_b = abs(b->data);//数字 b 的长度
    DuLNode *upper,*lower;//被加数 & 加数
    if(len_a > len_b)
    {
        upper = a;
        lower = b;
    }
    else{
        upper = b;
        lower = a;
    }
    int len_up = abs(upper->data);//被加数的长度
    int len_low = abs(lower->data);//加数的长度
    int cnt = 0;
    int carry = 0; //进位
    while (cnt != len_up)
    {
        upper = upper->prior; //从末尾开始逆向遍历
        lower = lower->prior;
        if (cnt < len_low)
        {
            upper->data = upper->data + lower->data + carry;
        }
        else
        {
            upper->data = upper->data + carry;
        }
        carry = 0;
        if (upper->data >= 10)
        {
            upper->data -= 10;
            carry = 1;
        }
        cnt++;
    }
    if (carry)//如果还要进位，在head后插入一个节点
    {
        DuLNode *p;
        p = (DuLNode *)malloc(sizeof(DuLNode));
        p->data = carry;
        p->prior = upper->prior;
        upper->prior->next = p;
        p->next = upper;
        upper->prior = p;
        upper = p;
        ++len_up;
    }
    upper = upper->prior;
    upper->data = symbol*len_up;
    return upper;
}

DuLNode *subtraction(DuLNode *a, DuLNode *b)
{
    int len_a = abs(a->data);
    int len_b = abs(b->data);
    DuLNode *upper = NULL, *lower = NULL;
    if(len_a > len_b)
    {
        upper = a;
        lower = b;
    }
    else if(len_a < len_b)
    {
        upper = b;
        lower = a;
    }
    else//等长
    {
        DuLNode *tmp1 = a, *tmp2 = b;
        int cnt = 0;
        tmp1 = tmp1->next;
        tmp2 = tmp2->next;
        while (cnt != len_a)
        {
            if(tmp1->data > tmp2->data)//a为正数b为负数
            {
                upper = a;
                lower = b;
                break;
            }
            else if(tmp1->data < tmp2->data)//b为正数a为负数
            {
                upper = b;
                lower = a;
                break;
            }
            tmp1 = tmp1->next;
            tmp2 = tmp2->next;
            cnt ++;
        }
        if(cnt == len_a)
        {
            upper = a;
            lower = b;
        }
    }
    int len_up = abs(upper->data);
    int len_low = abs(lower->data);
    int symbol = abs(upper->data)/(upper->data);
    int cnt = 0;
    int carry = 0;  //借位
    
    while (cnt != len_up)
    {
        upper = upper->prior; //从末尾开始逆向遍历
        lower = lower->prior;
        if (cnt < len_low)
        {
            upper->data = upper->data - lower->data - carry;
        }
        else
        {
            upper->data = upper->data - carry;
        }
        carry = 0;
        if (upper->data < 0)
        {
            upper->data += 10;//借位操作
            carry = 1;
        }
        cnt ++;
    }
        upper=upper->prior;//逆向遍历
        upper->data = symbol*len_up;
        return upper;
}

void printDuLNode(DuLNode *head)
{
    DuLNode *p;
    p = head;
    int len = abs(p->data);
    int cnt = 0;
    if(p->data < 0)//检查符号，位数
    {
        printf("-");
    }
    p = p->next;
    while(p->data == 0 && p->next != NULL)
    {
        p = p->next;
        --len;
    }
    while(len)
    {
        printf("%d", p->data);
        p = p->next;
        len--;
        if(!(len%4) && len) putchar(',');
    }
    printf("\n");
}

void main()
{
    printf("请输入需要计算的两个长整数，以分号隔开(如：-9999,9999;1,0000,0000)\n");
    DuLNode *a;
    a = DuLCreate();
    if(a->data == 0)
    {
        printf("invalid input(A)");
    }
    else
    {
        DuLNode *b;
        b = DuLCreate();
        if(b->data == 0)
        {
            printf("invalid input(B)");
        }
        else
        {
            DuLNode *c;
            if((a->data)*(b->data)<0)
                {
                    c = subtraction(a,b);
                }
            else
                {
                    c = addition(a,b);
                }
            printDuLNode(c);
        }
    }
}
