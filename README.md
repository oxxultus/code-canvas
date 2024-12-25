# 프로젝트 이름

## 소개
이 프로젝트는 **스프링부트(Sprint Boot)**를 사용하여 개발된 웹 애플리케이션입니다. 내부 구조는 **MVC** 패턴을 따르며, 데이터베이스는 **MySQL**을 사용하고, 빌드는 **Gradle**로 관리됩니다.

## 주요 기술 스택
- **프로그래밍 언어**: Java (버전 17), HTML, CSS, JavaScript
- **프레임워크**: Spring Boot
- **빌드 도구**: Gradle
- **데이터베이스**: MySQL

## 사용된 주요 라이브러리 및 의존성
다음은 `build.gradle`에서 설정된 주요 의존성입니다:

```gradle
implementation 'org.springframework.boot:spring-boot-starter-web'
implementation 'org.projectlombok:lombok:1.18.34'
implementation 'org.springframework.boot:spring-boot-starter-actuator'
annotationProcessor 'org.projectlombok:lombok:1.18.34'
implementation 'org.springframework.boot:spring-boot-starter-data-jpa'
implementation 'org.springframework.boot:spring-boot-starter-security'
testImplementation 'org.springframework.security:spring-security-test'
developmentOnly 'org.springframework.boot:spring-boot-devtools'
implementation 'org.springframework.boot:spring-boot-starter-tomcat'
testImplementation 'org.springframework.boot:spring-boot-starter-test'
implementation 'mysql:mysql-connector-java:8.0.33'
testRuntimeOnly 'org.junit.platform:junit-platform-launcher'
implementation 'org.apache.tomcat.embed:tomcat-embed-jasper'
implementation 'jakarta.servlet:jakarta.servlet-api:6.0.0'
implementation 'com.fasterxml.jackson.core:jackson-databind'
implementation 'jakarta.servlet.jsp.jstl:jakarta.servlet.jsp.jstl-api:2.0.0'
implementation 'org.glassfish.web:jakarta.servlet.jsp.jstl:2.0.0'
```

## 프로젝트 구조
프로젝트는 **MVC 아키텍처**로 설계되었으며, 다음과 같은 구성 요소를 포함합니다:

- **Model**: 데이터베이스와의 상호작용을 담당
- **View**: 사용자에게 보여지는 UI
- **Controller**: 비즈니스 로직을 처리하고 View와 Model을 연결

---

## 빌드 및 실행 방법
1. 이 저장소를 클론합니다:
   ```bash
   git clone <저장소 URL>
   cd <프로젝트 폴더>
  ```

2. Gradle로 프로젝트를 빌드합니다:
  ```bash
  ./gradlew build
  ```

3. MySQL 데이터베이스를 설정합니다:
  `데이터베이스` 생성
  `application.properties` 파일에 DB 연결 정보를 입력

4. 애플리케이션을 실행합니다:
  ```bash
  ./gradlew bootRun
  ```

5. 브라우저에서 다음 URL로 애플리케이션에 접근합니다:
  ``` 
  http://localhost:8080
  ```
