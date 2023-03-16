FROM openjdk:8
EXPOSE 8080
ADD target/springboot-junit-mockito.jar springboot-junit-mockito.jar
ENTRYPOINT ["java","-jar","/springboot-junit-mockito.jar"]