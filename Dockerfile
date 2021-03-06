FROM pataquets/newrelic-platform-installer

RUN \
  bin/node npi.js fetch com.newrelic.plugins.mysql.instance -y && \
  bin/node npi.js config set license_key YOUR_LICENSE_KEY && \
  bin/node npi.js prepare com.newrelic.plugins.mysql.instance --noedit --override

ADD plugin.json ./plugins/com.newrelic.plugins.mysql.instance/newrelic_mysql_plugin-2.0.0/config/plugin.json

CMD [ "bin/node", "npi.js", "start", "com.newrelic.plugins.mysql.instance", "--foreground" ]
