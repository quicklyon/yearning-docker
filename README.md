<!-- 该文档是模板生成，手动修改的内容会被覆盖，详情参见：https://github.com/quicklyon/template-toolkit -->
# QuickOn Yearning 应用镜像

[![GitHub Workflow Status](https://github.com/quicklyon/yearning-docker/actions/workflows/docker.yml/badge.svg)](https://github.com/quicklyon/yearning/actions/workflows/docker.yml)
![Docker Pulls](https://img.shields.io/docker/pulls/easysoft/yearning?style=flat-square)
![Docker Image Size](https://img.shields.io/docker/image-size/easysoft/yearning?style=flat-square)
![GitHub tag](https://img.shields.io/github/v/tag/quicklyon/yearning-docker?style=flat-square)

> 申明: 该软件镜像是由QuickOn打包。在发行中提及的各自商标由各自的公司或个人所有，使用它们并不意味着任何从属关系。

## 快速参考

- 通过 [渠成软件百宝箱](https://www.qucheng.com/app-install/install-yearning-173.html) 一键安装 **Yearning**
- [Dockerfile 源码](https://github.com/quicklyon/yearning-docker)
- [Yearning 源码](https://github.com/cookieY/Yearning)
- [Yearning 官网](http://next.yearning.io)

## 一、关于 Yearning

[Yearning](https://next.yearning.io/) 开箱即用的MYSQL SQL审核工具。

Yearning官网：[http://next.yearning.io](http://next.yearning.io)

## Feature 功能

-   SQL 查询
    -   查询工单
    -   导出
    -   自动补全，智能提示
    -   查询语句审计
    -   查询结果脱敏
-   SQL 审核
    -   流程化工单
    -   SQL语句语法检测
    -   根据规则检测SQL语句合规性
    -   自动生成DDL/DML回滚语句
    -   历史审核记录
-   推送
    -   E-mail 工单推送
    -   钉钉 webhook 机器人工单推送
-   用户权限及管理
    - 角色划分
    - 基于用户的细粒度权限
    - 注册
-   其他
    -   todoList
    -   LDAP 登录
    -   动态审核规则配置
    -   自定义审核层级
    -   OIDC SSO 自动注册与登录
-   AutoTask 自执行

## 二、支持的版本(Tag)

由于版本比较多,这里只列出最新的5个版本,更详细的版本列表请参考:[可用版本列表](https://hub.docker.com/r/easysoft/yearning/tags/)

<!-- 这里是镜像的【Tag】信息，通过命令维护，详情参考：https://github.com/quicklyon/template-toolkit -->

- [`latest`](https://github.com/cookieY/Yearning/releases)
- [3.1.0](https://github.com/cookieY/Yearning/releases/tag/v3.1.0)
- [3.1.1](https://github.com/cookieY/Yearning/releases/tag/v3.1.1)

## 三、获取镜像

推荐从 [Docker Hub Registry](https://hub.docker.com/r/easysoft/yearning) 拉取我们构建好的官方Docker镜像。

```bash
docker pull easysoft/yearning:latest
```

如需使用指定的版本,可以拉取一个包含版本标签的镜像,在Docker Hub仓库中查看 [可用版本列表](https://hub.docker.com/r/easysoft/yearning/tags/)

```bash
docker pull easysoft/yearning:[TAG]
```

## 四、持久化数据

如果你删除容器，所有的数据都将被删除，下次运行镜像时会重新初始化数据。为了避免数据丢失，你应该为容器提供一个挂在卷，这样可以将数据进行持久化存储。

为了数据持久化，你应该挂载持久化目录：

- /data 持久化数据

如果挂载的目录为空，首次启动会自动初始化相关文件

```bash
$ docker run -it \
    -v $PWD/data:/data \
docker pull easysoft/yearning:latest
```

或者修改 docker-compose.yml 文件，添加持久化目录配置

```bash
services:
  Yearning:
  ...
    volumes:
      - /path/to/persistence:/data
  ...
```

## 五、环境变量

<!-- 这里写应用的【环境变量信息】 -->

示例：

| 变量名           | 默认值        | 说明                             |
| ---------------- | ------------- | -------------------------------- |
| EASYSOFT_DEBUG   | false         | 是否打开调试信息，默认关闭       |
| DB_HOST       | 127.0.0.1     | MySQL 主机地址                   |
| DB_PORT       | 3306          | MySQL 端口                       |
| DB_NAME         | yearning          | Yearning 数据库名称                 |
| DB_USER       | root          | MySQL 用户名                      |
| DB_PASSWORD   | pass4Yearn1ng     | MySQL 密码                        |

## 六、运行

### 6.1 单机Docker-compose方式运行

```bash
# 启动服务
make run

# 查看服务状态
make ps

# 查看服务日志
docker-compose logs -f yearning

```

<!-- 这里写应用的【make命令的备注信息】位于文档最后端 -->

示例
**说明:**

- 启动成功后，打开浏览器输入 `http://<你的IP>:8000` 访问管理后台
- 默认用户名：`admin`，默认密码：`Yearning_admin`

![](img/login.png)
![](img/dash.png)
![](img/audit.png)
![](img/query.png)
![](img/record.png)
- [VERSION](https://github.com/quicklyon/yearning-docker/blob/master/VERSION) 文件中详细的定义了Makefile可以操作的版本
- [docker-compose.yml](https://github.com/quicklyon/yearning-docker/blob/master/docker-compose.yml)

## 七、版本升级

<!-- 这里是镜像的【版本升级】信息，通过命令维护，详情参考：https://github.com/quicklyon/template-toolkit -->
