FROM openjdk:17-alpine
ENV ALLOWED_ORIGINS http://localhost:3000,http://aazz282828-alps:3000,https://*.ngrok-free.app,https://*.onrender.com,https://*.vercel.app
RUN mkdir /opt/app
COPY /target/storyteller-0.0.1-SNAPSHOT.jar /opt/app/japp.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/opt/app/japp.jar"]

## 使用 Maven 官方镜像作为基础
#FROM maven:3.8.4-openjdk-17-slim AS builder
#
## 设置工作目录
#WORKDIR /app
#
## 复制项目文件到容器中
#COPY . .
#
## 运行 Maven 打包命令
#RUN mvn package
#
## 创建另一个基于 OpenJDK 17 的镜像作为运行时镜像
#FROM openjdk:17-alpine
#
## 设置工作目录
#WORKDIR /app
#
## 将构建好的 JAR 文件复制到运行时镜像中
#COPY --from=builder /app/target/storyteller-0.0.1-SNAPSHOT.jar app.jar
#
## 暴露端口
#EXPOSE 8080
#
## 启动 Spring Boot 应用程序
#CMD ["java", "-jar", "app.jar"]
