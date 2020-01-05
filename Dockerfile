FROM 192.168.99.100:5000/openjdk
ENV APP_ENV dev
COPY ./build/libs/*.jar /myapp/myapp.jar
COPY ./run.sh /myapp/
WORKDIR /myapp

EXPOSE 8080

ENTRYPOINT ["sh", "/myapp/run.sh"]