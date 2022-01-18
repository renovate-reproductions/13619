FROM gradle:5.4.1-jdk8-alpine@sha256:1cb081cfa6d25d718f6276c3df6474b332c06278d8bb64bcb0fc1243b1e4491e AS build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build --no-daemon 

FROM openjdk:11-jre-slim@sha256:77eeab945d4cfb3d332e0984400085141d0f84bc6af37e099d1a39f947ef2272

EXPOSE 8080

RUN mkdir /app

COPY --from=build /home/gradle/src/build/libs/*.jar /app/spring-boot-application.jar

ENTRYPOINT ["java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-Djava.security.egd=file:/dev/./urandom","-jar","/app/spring-boot-application.jar"]

