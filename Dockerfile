FROM 192.168.99.100:5000/openjdk

COPY ./build/libs/*.jar /myapp/myapp.jar
COPY ./run.sh /myapp/
WORKDIR /myapp

EXPOSE 8080

CMD ["/app/run.sh"]
