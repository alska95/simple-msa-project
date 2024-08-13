FROM maven:3.8.4-openjdk-17-slim as build
WORKDIR /app
COPY . /app

# Maven 빌드 프로필을 변수로 전달
ARG MAVEN_PROFILE=local
# Docker 이미지 내에서 애플리케이션의 패키징이 이루어진다.
RUN mvn clean package -P${MAVEN_PROFILE} -DskipTests
FROM amazoncorretto:17-al2023-jdk
WORKDIR /app
# 빌드 단계에서 생성된 JAR 파일이 복사된다.
COPY --from=build /app/target/gateway-1.0.jar gateway-1.0.jar
# java -jar gateway-1.0.jar 명령을 통해 애플리케이션이 시작된다.
ENTRYPOINT ["java","-jar","gateway-1.0.jar"]