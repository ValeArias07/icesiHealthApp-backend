const sonarqubeScanner = require('sonarqube-scanner');
sonarqubeScanner(
  {
    serverUrl: 'http://20.169.198.136:9000/',
    token: process.env.SONAR_TOKEN || '',
    options: {}
  },
  () => process.exit()
);