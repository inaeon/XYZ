FROM tomcat:latest
COPY target/XYZtechnologies-1.0.war /usr/local/tomcat/webapps/ROOT.war

ENV CATALINA_OPTS="-Dcom.sun.management.jmxremote \
                   -Dcom.sun.management.jmxremote.port=9090 \
                   -Dcom.sun.management.jmxremote.rmi.port=9091 \
                   -Dcom.sun.management.jmxremote.ssl=false \
                   -Dcom.sun.management.jmxremote.authenticate=false \
                   -Djava.rmi.server.hostname=0.0.0.0"
                   
EXPOSE 8080 9090 9091                   


CMD ["catalina.sh", "run"]
