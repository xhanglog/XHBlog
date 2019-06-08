# XHBlog
### 运行说明

本系统使用JDK1.8，Tomcat8.0，MySQL5.7，系统做了集群处理，如果想直接运行项目，可直接使用“**配置好的项目**”。如果想要自己配置，可参考下面步骤：

1.基本配置

- 安装好JDK，MySQL

- 导入数据库文件“**xhanglog.sql**”，修改db.properties里的数据库用户名和密码。

- 将项目导入编辑工具，可以使用Eclipse或者Idea。项目使用的Maven构建，建议把Maven远程仓库的地址改为阿里的地址：

  ```html
  <mirror> 
        <id>alimaven</id> 
        <name>aliyun maven</name> 
        <url>http://maven.aliyun.com/nexus/content/groups/public/</url> 
        <mirrorOf>central</mirrorOf>         
     	</mirror>
  ```

- 配置文件说明

  - qiniuConfig.properties：配置自己的七牛云服务器的基本信息，可以不修改
  - qqconnectconfig.properties：配置QQ开发者的基本信息，可以不修改
  - log4j.properties：配置日志信息

- 在编辑器配置好JDK环境和Tomcat环境后即可运行。此时项目是单个项目运行。

2.集群配置

- 解压软件里边的“**nginx-1.14.2**”，此处以两个Tomcat服务器为例，修改配置：

  ```xml
  #user  nobody;
  worker_processes  1;
  
  #error_log  logs/error.log;
  #error_log  logs/error.log  notice;
  #error_log  logs/error.log  info;
  
  #pid        logs/nginx.pid;
  
  
  events {
      worker_connections  1024;
  }
  
  
  http {
      include       mime.types;
      default_type  application/octet-stream;
  
      sendfile        on;
      keepalive_timeout  65;
  
      upstream xhanglog{
         server 127.0.0.1:18080;
         server 127.0.0.1:28080;
      }
  
      server {
          listen       80;
          server_name  localhost;
  
          location / {
          	proxy_pass http://xhanglog;
              root   html;
              index  index.html index.htm;
          }
  
          error_page   500 502 503 504  /50x.html;
          location = /50x.html {
              root   html;
          }
  
      }
  }
  
  ```

- 解压出两个tomcat，命名为Tomcat1，Tomcat2,修改访问端口分别为18080,28080，这个端口要同Nginx中的配置一致。将项目导出war包放置到tomcat的webapps下。

- 缓存同步处理（手动发现）：此处的监听端口一定要修改为电脑未占用的端口，否则会产生端口冲突

  - 修改tomcat1里边的项目的ehcache.xml为

  ```xml
  <?xml version="1.0" encoding="UTF-8"?>
  <ehcache xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
           xsi:noNamespaceSchemaLocation="http://ehcache.org/ehcache.xsd"
           updateCheck="false">
      <diskStore path="java.io.tmpdir"/>
      <cacheManagerPeerProviderFactory class= "net.sf.ehcache.distribution.RMICacheManagerPeerProviderFactory"
          properties="peerDiscovery=manual,
   rmiUrls=//localhost:40030/menu|//localhost:40030/tag|//localhost:40030/artical|
            //localhost:40030/link"/>
      <cacheManagerPeerListenerFactory class="net.sf.ehcache.distribution.RMICacheManagerPeerListenerFactory"
              properties="hostName=localhost,port=40000,socketTimeoutMillis=120000"/>
      <defaultCache
              maxElementsInMemory="10000"
              eternal="false"
              overflowToDisk="true"
              timeToIdleSeconds="900"
              timeToLiveSeconds="900"
              diskPersistent="false"
              diskExpiryThreadIntervalSeconds="900" />
  
      <cache name="menu"
             maxElementsInMemory="10000"
             maxElementsOnDisk="100000"
             eternal="false"
             timeToIdleSeconds="900"
             timeToLiveSeconds="900"
             overflowToDisk="true"
             diskPersistent="false">
          <cacheEventListenerFactory class="net.sf.ehcache.distribution.RMICacheReplicatorFactory"/>
      </cache>
  
      <cache name="tag"
             maxElementsInMemory="10000"
             maxElementsOnDisk="100000"
             eternal="false"
             timeToIdleSeconds="900"
             timeToLiveSeconds="900"
             overflowToDisk="true"
             diskPersistent="false">
          <cacheEventListenerFactory class="net.sf.ehcache.distribution.RMICacheReplicatorFactory"/>
      </cache>       
  
      <cache name="artical"
             maxElementsInMemory="10000"
             maxElementsOnDisk="100000"
             eternal="false"
             timeToIdleSeconds="900"
             timeToLiveSeconds="900"
             overflowToDisk="true"
             diskPersistent="false">
          <cacheEventListenerFactory class="net.sf.ehcache.distribution.RMICacheReplicatorFactory"/>
      </cache>
  
      <cache name="link"
             maxElementsInMemory="10000"
             maxElementsOnDisk="100000"
             eternal="false"
             timeToIdleSeconds="900"
             timeToLiveSeconds="900"
             overflowToDisk="true"
             diskPersistent="false">
          <cacheEventListenerFactory class="net.sf.ehcache.distribution.RMICacheReplicatorFactory"/>
      </cache>
  
  </ehcache>
  ```

  - 修改tomcat2里边的项目的ehcache.xml为

  ```xml
  <?xml version="1.0" encoding="UTF-8"?>
  <ehcache xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
           xsi:noNamespaceSchemaLocation="http://ehcache.org/ehcache.xsd"
           updateCheck="false">
      <diskStore path="java.io.tmpdir"/>
      <cacheManagerPeerProviderFactory class= "net.sf.ehcache.distribution.RMICacheManagerPeerProviderFactory"
          properties="peerDiscovery=manual,
     rmiUrls=//localhost:40000/menu|//localhost:40000/tag|//localhost:40000/artical|
            //localhost:40000/link"/>
      <cacheManagerPeerListenerFactory class="net.sf.ehcache.distribution.RMICacheManagerPeerListenerFactory"
              properties="hostName=localhost,port=40030,socketTimeoutMillis=120000"/>
      <defaultCache
              maxElementsInMemory="10000"
              eternal="false"
              overflowToDisk="true"
              timeToIdleSeconds="900"
              timeToLiveSeconds="900"
              diskPersistent="false"
              diskExpiryThreadIntervalSeconds="900" />
  
      <cache name="menu"
             maxElementsInMemory="10000"
             maxElementsOnDisk="100000"
             eternal="false"
             timeToIdleSeconds="900"
             timeToLiveSeconds="900"
             overflowToDisk="true"
             diskPersistent="false">
          <cacheEventListenerFactory class="net.sf.ehcache.distribution.RMICacheReplicatorFactory"/>
      </cache>
  
      <cache name="tag"
             maxElementsInMemory="10000"
             maxElementsOnDisk="100000"
             eternal="false"
             timeToIdleSeconds="900"
             timeToLiveSeconds="900"
             overflowToDisk="true"
             diskPersistent="false">
          <cacheEventListenerFactory class="net.sf.ehcache.distribution.RMICacheReplicatorFactory"/>
      </cache>       
  
      <cache name="artical"
             maxElementsInMemory="10000"
             maxElementsOnDisk="100000"
             eternal="false"
             timeToIdleSeconds="900"
             timeToLiveSeconds="900"
             overflowToDisk="true"
             diskPersistent="false">
          <cacheEventListenerFactory class="net.sf.ehcache.distribution.RMICacheReplicatorFactory"/>
      </cache>
  
      <cache name="link"
             maxElementsInMemory="10000"
             maxElementsOnDisk="100000"
             eternal="false"
             timeToIdleSeconds="900"
             timeToLiveSeconds="900"
             overflowToDisk="true"
             diskPersistent="false">
          <cacheEventListenerFactory class="net.sf.ehcache.distribution.RMICacheReplicatorFactory"/>
      </cache>
  </ehcache>
  ```

- 依次运行Tomcat1，Tomcat2，Nginx。

- 在本地运行时，要在hosts文件将www.xhanglog.cn改为指向ip  127.0.0.1，不然QQ登录可能会报错

- 前台访问地址：http://localhost

- 后台访问地址：http://localhost/login.html

  - 默认用户名：贰月小巷   
  - 密码：123123
