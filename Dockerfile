#멀티스테이지 빌드
FROM maven:3.8.5-openjdk-17 AS builder

# 작업 디렉토리 설정
WORKDIR /app

# pom.xml과 소스 파일을 복사
COPY pom.xml .
COPY src ./src

# Maven 빌드 실행
RUN mvn clean package -DskipTests

# 최종 이미지 생성 단계
FROM eclipse-temurin:17-jdk AS final

# 작업 디렉토리 설정
WORKDIR /app

# 빌드된 jar 파일을 복사
COPY --from=builder /app/target/*.jar app.jar

# 로그 디렉토리 생성
RUN mkdir -p /var/log/edu

# 애플리케이션 실행
ENTRYPOINT ["java", "-jar", "app.jar"]
