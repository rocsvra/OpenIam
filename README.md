# OpenIam
轻量级通用 Identity and Access Management (以下简称 Iam) 解决方案，用于满足企业内部各系统的单点登录（集成了 钉钉、企业微信、用户名、手机号、工号等多种方式）、用户管理、组织管理、授权管理的基本需求。    
系统目前主要基于 `Asp.Net Core 3.1`, `EF Core 3.1`, `IdentityServer4`, `Layui 2.5.7` 技术实现，使用 Postgresql 数据库。

## 效果图
##### 登录（小屏）
<img src="./Docs/smallScreen.png" width="200" ></img>

##### 登录（大屏）
<img src="./Docs/largeScreen.png" width="500" ></img>

##### 首页
<img src="./Docs/index.png" width="500" ></img>

##### 客户端管理
<img src="./Docs/client.png" width="500" ></img>

##### 权限管理
<img src="./Docs/permission.png" width="500" ></img>

## 功能说明
OpenIam 主要用于内部系统间的统一身份认证及权限管理，核心功能包括：客户端管理、用户管理、授权管理、组织机构管理。

#### 客户端管理
每个子系统如果需要接入 OpenIam，则必须先要在 OpenIam 中注册一个客户端，获取对应的 `Client Id`, `Client Secret`。如果客户端需要访问需要授权的 Api 服务，则可以把 Api 服务作为 Scope 天不假到客户端中，从而可以利用 OpenIam 进行统一鉴权。

#### 用户管理
1. 提供用户名、手机号、工号登录方式，其中手机号、工号登录方式默认开启，可选择关闭
1. 集成钉钉、企业微信两种外部扫码登录方式
1. 可后台添加用户，也可以用户自主注册（默认关闭，注册后需要管理员激活才能登录）
1. 可对用户的所属组织、权限、角色进行控制

#### 组织机构管理
1. 提供组织机构的 CRUD 操作
1. 可管理组织中的用户
1. 可管理组织默认的角色（所有属于该组织的用户自动继承这些角色）

#### 授权管理
授权系统主要由权限、角色、组织机构 几块构成，其中权限为最细粒度的控制，角色用于对权限按照一定规则进行分组，组织机构可以包含一些默认的角色，只要属于该组织的用户则自动拥有某个角色（及其权限）。   

## 使用说明
#### 准备工作
1. `git pull https://github.com/stg609/OpenIam`
1. 安装 Postgres 数据库
1. 在 Postgres 中创建数据库，并执行 **Web\Infra\Scrips** 中的 `01_init.sql` 脚本
   
#### Docker 方式
1. ```
   docker run -p 5002:443 
     -e ASPNETCORE_ENVIRONMENT=Development 
     -e ASPNETCORE_Kestrel__Certificates__Default__Path=/https/openIam.pfx 
     -e ASPNETCORE_Kestrel__Certificates__Default__Password=111111 
     -e "ASPNETCORE_URLS=https://+:443;http://+:80" 
     -e "IamOptions__Host=https://localhost" 
     -e "ConnectionStrings__DefaultConnection=替换成你的数据库连接字符串"
     stg609/openiam:v1.0.0
    ``` 
    这个命令把容器中的 `443` 映射到了本机的 `5002` 端口，并且设置了 Https 的证书（基于 OpenSSL)。当命令成功执行后，会在控制台打印出当前正在监听的端口。这个命令并没有配置**钉钉**、**企业微信**相关的配置，所以无法正常使用，如果需要正常使用，则需要加上额外的环境变量，具体请参考 `appsettings.json`。
1. 访问 https://localhost:5002 即可


未完待续
