FROM 192.168.99.100:5000/openjdk

COPY ./build/libs/*.jar /myapp/myapp.jar
WORKDIR /myapp

EXPOSE 8080

CMD java -jar myapp.jar
