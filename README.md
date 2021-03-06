# flutter_travel

A travels Flutter project. 

## Proview
![App proview](./snapshot/demo1.gif "App proview animation")
<br/>
<br/>

资讯页 | 发现页 |  图片预览  
-|-|-
![资讯页](./snapshot/WechatIMG325.jpeg "资讯页") | ![发现页](./snapshot/WechatIMG326.jpeg "发现页") | ![图片预览](./snapshot/WechatIMG327.jpeg "图片预览") | 

图片列表 | 个人页 |  详情页  
-|-|-
![图片列表](./snapshot/WechatIMG328.jpeg "图片列表") | ![个人页](./snapshot/WechatIMG330.jpeg "个人页") | ![详情页](./snapshot/WechatIMG380.png "详情页") |
 

## Upgrade
```shell 
flutter upgrade 
```
<br/>

## DEVELOPMENT RUN
> 对接接口时借助 Charles 抓包析工具能提升开发效率和快速定位问题,请注意 Charles 端口是否已设置为 8888(默认值)  

[Charles Web Debugging Proxy](https://www.charlesproxy.com/)<br/>

#### 开发环境启动注意：
1.配置config/ConfigDev.dart配置 
```js
/// proxy服务器地址，只有开发环境走proxy
String getProxyUrl() {
	return '127.0.0.1:8888'; 
}
```
2.点击DEBUG启动按钮，选择开发环境启动
![App debug](./snapshot/debug.png "App debug")
<br/>
<br/>
## BUILD
```shell
// 开发环境 
flutter build -t lib/core/env/EnviromentDev.dart

// 测试环境
flutter build -t lib/core/env/EnviromentTest.dart

// 灰度环境
flutter build -t lib/core/env/EnviromentGrey.dart

// 生产环境
flutter build -t lib/main.dart
```
<br/>


## STRUCTS
```shell
lib
  |-- config 		环境配置目录
  |-- core   		核心逻辑
  |-- pages  		业务逻辑
  |----- common  	业务逻辑公用组件
  |----- modules 	业务逻辑模块存放目录
  |----- utils 		工具类 
  |-- redux  		状态管理
  |----- actions 	业务逻辑action
  |----- reducers 	业务逻辑reducer
  |----- states 	业务逻辑state
  |-- routers 		虚拟路由页面，用于表示各业务逻辑页面入口
  |-- services 		业务逻辑调用接口存一存放目录
```

This project is a starting point for a Flutter application. 

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.io/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.io/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

<br/>

# Tips:
### Could not determine the dependencies of task ':app:flutterBuildDebug' when start vscode flutter debugging 错误解决办法
```javascript
错误解决办法

flutter clean
然后
flutter run

生成JSON序列化文件.g.dart 
flutter packages pub run build_runner build
或者
flutter packages pub run build_runner build --delete-conflicting-outputs
```

<br/>

### Build file '../android/app/build.gradle' line: 25 错误解决办法
```javascript
1：修改build.gradle,注释掉jcenter()，google()。使用阿里的镜像。原因是jcenter google库无法访问到导致的问题。

buildscript {
    repositories {
        //google()
        //jcenter()
        maven { url 'https://maven.aliyun.com/repository/google' }
        maven { url 'https://maven.aliyun.com/repository/jcenter' }
        maven { url 'http://maven.aliyun.com/nexus/content/groups/public' }
    }

    dependencies {
        classpath 'com.android.tools.build:gradle:3.1.2'
    }
}

allprojects {
    repositories {
        //google()
        //jcenter()
        maven { url 'https://maven.aliyun.com/repository/google' }
        maven { url 'https://maven.aliyun.com/repository/jcenter' }
        maven { url 'http://maven.aliyun.com/nexus/content/groups/public' }
    }
}

2：找到fluttersdk目录 进入如下目录

Macintosh HD⁩ ▸ ⁨用户⁩ ▸ ⁨rabbit⁩ ▸ ⁨资源库⁩ ▸ ⁨Flutter⁩ ▸ ⁨packages⁩ ▸ ⁨flutter_tools⁩ ▸ ⁨gradle⁩
找到 flutter.gradle文件替换如下内容。

​buildscript {
    repositories {
        //jcenter()
        //maven {
        //    url 'https://dl.google.com/dl/android/maven2'
        //}
        maven{
            url 'https://maven.aliyun.com/repository/jcenter'
        }
        maven{
            url 'http://maven.aliyun.com/nexus/content/groups/public'
        }
    }
    dependencies {
        classpath 'com.android.tools.build:gradle:3.1.2'
    }
} 
```

<br/>

### sun.security.validator.ValidatorException: PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target 错误解决办法
```javascript
1.访问http://maven.aliyun.com, 原因为需要将MAVEN下载的阿里云HTTPS证书手动导入JDK中认证

2.F12， 打开开发者面板，定位Security -> Overview -> View certificate

3.在打开的面板中拖动*.aliyun.com.cer证书，下载至本地目录
4.导入证书至JDK，使用如下命令

sudo keytool -import -v -trustcacerts -alias .aliyun.com -file /存放证书路径/*.aliyun.com.cer -keystore /JDK路径/Contents/Home/jre/lib/security/cacerts -keypass changeit -storepass changeit

5.重启系统
```