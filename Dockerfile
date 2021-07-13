FROM openjdk:11-jre 

ARG JAR_FILE=spring-petclinic/target/*.jar

RUN addgroup --system petclinic && adduser --system --group petclinic
USER petclinic:petclinic

CMD ["sh", "/opt/app/bin/run.sh"]

COPY ${JAR_FILE} app.jar
EXPOSE 8080
CMD ["bash", "-c", "java -jar $JAVA_OPTS /app.jar"]