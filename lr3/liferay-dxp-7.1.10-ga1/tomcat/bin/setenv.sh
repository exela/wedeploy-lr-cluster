CATALINA_OPTS="$CATALINA_OPTS -Dfile.encoding=UTF8 -Djava.net.preferIPv4Stack=true -Dorg.apache.catalina.loader.WebappClassLoader.ENABLE_CLEAR_REFERENCES=false -Duser.timezone=GMT -Xmx4g -XX:MaxMetaspaceSize=2g -Djgroups.bind_addr=lr3 -Djgroups.tcpping.initial_hosts=lr1[8080],lr2[8080],lr3[8080]"