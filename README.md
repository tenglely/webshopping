# webshopping
网上商城

项目使用技术：javaweb,mysql,struts2+spring+hibernate,jsp,tomcat

导入项目：在ssh_project内有个网上商城的**rar压缩文件**，里面有项目的**war文件，sql文件，需求分析，软件安装使用说明书**。导入可依软件安装使用说明书步骤。

**系统简介**
本系统主要功能为实现网上买鞋，方便卖家管理网店和方便买家购买鞋子。
本系统可以细分为两个子系统：后台管理系统，用户购买系统。
后台管理系统的主要工作过程为：管理员**录入商品信息**，**上传商品图片**，**编辑商品介绍**，**管理商品信息**，**订单信息**，**用户信息**，**导出数据报表**，**自定义首页内容**。
用户购买系统的主要功能为：**浏览商品****，**购买商品****，**添加购物车**，**查看历史订单信息**,**支付宝支付订单**。

**系统效果：**

1.商城首页。（管理员和用户首先都是进入这里）

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190116144229497.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1RlbmdfaXNfYV9saXR0bGViaXJk,size_16,color_FFFFFF,t_70)

2.登录账号：点击左上角的注册/登录

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190116144316656.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1RlbmdfaXNfYV9saXR0bGViaXJk,size_16,color_FFFFFF,t_70)

新用户可以点击注册：

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190116144403323.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1RlbmdfaXNfYV9saXR0bGViaXJk,size_16,color_FFFFFF,t_70)

用户登陆后，返回商城首页。左上角变为**用户名+注销**

![在这里插入图片描述](https://img-blog.csdnimg.cn/2019011614442881.png)

点击用户名，可修改个人信息

![在这里插入图片描述](https://img-blog.csdnimg.cn/2019011614445822.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1RlbmdfaXNfYV9saXR0bGViaXJk,size_16,color_FFFFFF,t_70)

用户可以根据左侧菜单栏，选择自己想看的品牌、商品，也可以滚动鼠标往下浏览

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190116144518446.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1RlbmdfaXNfYV9saXR0bGViaXJk,size_16,color_FFFFFF,t_70)

点击商品进入商品详情页，用户可以在此选择**尺码**、**购买数量**，然后点击放入购物车或直接支付。商品介绍为管理员自己编辑的长图文，供用户查看商品详情

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190116144612878.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1RlbmdfaXNfYV9saXR0bGViaXJk,size_16,color_FFFFFF,t_70)

点击放入购物车后，进入购物车页面。用户可以于此**修改收货地址**，**删除订单**，前往**支付**

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190116144642298.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1RlbmdfaXNfYV9saXR0bGViaXJk,size_16,color_FFFFFF,t_70)

点击修改收货地址后，会弹出修改界面进行修改或关闭

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190116144702990.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1RlbmdfaXNfYV9saXR0bGViaXJk,size_16,color_FFFFFF,t_70)

点击去支付，跳去确认订单页

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190116144718449.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1RlbmdfaXNfYV9saXR0bGViaXJk,size_16,color_FFFFFF,t_70)

点击支付，跳去支付宝支付界面

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190116144828492.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1RlbmdfaXNfYV9saXR0bGViaXJk,size_16,color_FFFFFF,t_70)

支付是采用的**支付宝沙箱模拟**，故测试支付需手机下载支付宝沙箱APP。


![在这里插入图片描述](https://img-blog.csdnimg.cn/20190116144902435.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1RlbmdfaXNfYV9saXR0bGViaXJk,size_16,color_FFFFFF,t_70)

测试账号为：

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190116144922604.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1RlbmdfaXNfYV9saXR0bGViaXJk,size_16,color_FFFFFF,t_70)

支付完后，跳回商城首页。在历史记录可以查看该商品**是否出货**和**快递编号**

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190116144947175.png)

**管理员**登入**后台管理系统界面**。

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190116145012965.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1RlbmdfaXNfYV9saXR0bGViaXJk,size_16,color_FFFFFF,t_70)

点击添加商品。添加商品分3步，


**1.添加商品信息** 

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190116145032167.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1RlbmdfaXNfYV9saXR0bGViaXJk,size_16,color_FFFFFF,t_70)

**2.添加商品图片**

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190116145054885.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1RlbmdfaXNfYV9saXR0bGViaXJk,size_16,color_FFFFFF,t_70)

**3.编辑商品介绍**

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190116145115382.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1RlbmdfaXNfYV9saXR0bGViaXJk,size_16,color_FFFFFF,t_70)

添加商品完成后，会跳去管理商品页面。管理员可以于此对商品的信息，图片，长图文进行操作，浏览商品页面，根据不同属性对商品进行查询。（每10个分一页）

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190116145137356.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1RlbmdfaXNfYV9saXR0bGViaXJk,size_16,color_FFFFFF,t_70)

点击管理用户，管理员可以于此对用户进行删除，查询操作

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190116145156213.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1RlbmdfaXNfYV9saXR0bGViaXJk,size_16,color_FFFFFF,t_70)

点击管理订单，管理员可以于此对订单进行修改/删除/查询操作，点击用户编号会查询出该用户的信息，点击商品编号会查询该商品的信息。（**修改主要是管理员对出货状态和快递编号进行修改**）

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190116145215258.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1RlbmdfaXNfYV9saXR0bGViaXJk,size_16,color_FFFFFF,t_70)

点击数据报表，管理员于此可以看到进入后台管理系统的界面。可以于此输出**用户/商品/订单的数据报表（xml文件）**

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190116145249914.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1RlbmdfaXNfYV9saXR0bGViaXJk,size_16,color_FFFFFF,t_70)

点击商城首页设置，可以选择**设置首页滚动图片**和**设置首页侧列表**

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190116145314320.png)

点击**设置首页滚动图片**，管理员可以上传不超过4张的图片**到首页中去**（每次上传都会替换掉之前的）

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190116145345531.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1RlbmdfaXNfYV9saXR0bGViaXJk,size_16,color_FFFFFF,t_70)

点击设置首页侧列表，管理员可以于此**设置首页侧列表的内容**。编辑完后，点击编辑完成按钮完成设置

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190116145408853.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1RlbmdfaXNfYV9saXR0bGViaXJk,size_16,color_FFFFFF,t_70)

