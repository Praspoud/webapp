pipeline {
  agent any

  environment {
        DOTNET_CLI_HOME = "/usr/share/dotnet"
    }
  stages {
    stage('Checkout') {
      steps {
        sh 'echo passed'
        //git branch: 'main', url: 'https://github.com/Praspoud/webapp.git'
      }
    }

    stage('Publish') {
	steps {
	  sh '''
	    cd /home/ubuntu/webapp1
	    dotnet publish --configuration Release --output /home/ubuntu/webapp1/publish
	    cp -r /home/ubuntu/webapp1/publish/* /var/www/webapp1
	    cd /etc/systemd/system
	    sudo systemctl stop webapp1.service
	    sudo systemctl start webapp1.service
	  '''
	}
    }
  }
}
	
