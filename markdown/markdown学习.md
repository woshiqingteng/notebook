Markdown简明

[TOC]

一、标题
语法：#+空格+内容

# 一级标题
## 二级标题
### 三级标题
#### 四级标题
##### 五级标题
###### 六级标题

二、段落格式

粗体/斜体
*斜体*
**粗体**
***斜体+粗体***

分割线
***
---

删除线
~~删除~~

下划线
<u>下划线</u>

脚注
创建脚注格式类似这样 [^1]。
[^1]: 菜鸟教程 -- 学的不仅是技术，更是梦想！！！

三、列表

无序列表
语法：*+空格+内容  

（符号*可以用+或者-替代）
* 第一项
* 第二项

+ 第一项
+ 第二项

- 第一项
- 第二项

有序列表
语法：数字+.+空格+内容
1. 第一点
2. 第二点

嵌套列表
语法：4个空格+*+空格+内容
* 第一点
    * 第一小点
    * 第二小点
* 第二点

四、区块
语法：>+空格+内容
> 第一层
>> 第二层
>>> 第三层

五、代码
片段
`printf()`函数

代码块
```python
print("adcdefg")
print(123456)
```

六、超链接
这是一个链接 [知乎](https://www.zhihu.com/)

直接使用链接：<https://www.zhihu.com/>

七、图片

![博客园](https://i-beta.cnblogs.com/assets/adminlogo.gif)

![博客园](https://i-beta.cnblogs.com/assets/adminlogo.gif "博客园")

八、表格
| 表头   | 表头   |
| ------ | ------ |
| 单元格 | 单元格 |
| 单元格 | 单元格 |

| 左对齐 | 右对齐 | 居中对齐 |
| :----- | -----: | :------: |
| 单元格 | 单元格 |  单元格  |
| 单元格 | 单元格 |  单元格  |

九、数学公式
$\int_0^1 {x^2}{\rm d}x$

十、画图
流程图
```mermaid
graph LR
A[开始] -->B(打开网页)
B --> C{输入查询}
C -->|搜索zin| D(zinyan.com)
C -->|搜索yan| E[zinyan.com]
```

```flow
st=>start: 开始框
op=>operation: 处理框
cond=>condition: 判断框(是或否?)
sub1=>subroutine: 子流程
io=>inputoutput: 输入输出框
e=>end: 结束框
st->op->cond
cond(yes)->io->e
cond(no)->sub1(right)->op
```

甘特图
```mermaid
        gantt
        dateFormat  YYYY-MM-DD
        title 软件开发甘特图
        section 设计
        需求                      :des1, 2022-01-06,2022-01-08
        原型                      :des2, 2022-01-09, 3d
        UI设计                    :des3, after des2, 5d
        UE设计                  :des4, after des3, 5d
        section 开发
        技术准备            :crit, done, 2022-01-06,24h
        设计框架            :crit, done, after des2, 2d
        开发                :crit, done, 8d
        发布                :crit, 2d
        section 测试
        功能测试             :done, a1, after des3, 3d
        压力测试             :after a1  , 20h
        测试报告             : 48h
```

UML 时序图
```mermaid
 sequenceDiagram
    participant 登录
    participant 接口
    登录->>接口: 我把密码账户传给你
    接口-->>后台:将数据通过https传给你
    loop 信息检测
        后台->后台: 判断账户信息是否正确
    end
    Note right of 后台: 用户信息等存在，我将数据改改后返回给你
    后台-->>接口: 用户信息
    接口-->>登录: 给你数据，你自己判断
    登录->>主界面: 访问成功
```
十一、其他
复选框
- [x] 选中状态
- [ ] 未选中状态

[Markdown基本语法](https://www.jianshu.com/p/191d1e21f7ed/)
[Markdown 各种标签介绍-一文了解各种markdown 脚本的使用](https://zinyan.com/?p=214)