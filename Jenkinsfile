pipeline {
  agent any

  environment {
        DOTNET_CLI_HOME = "/usr/share/dotnet"
    }
  stages {
    stage('Checkout') {
      steps {
        sh 'echo passed'
        git branch: 'main', url: 'https://github.com/Praspoud/webapp.git'
      }
    }
    //stage('Build and Test') {
      //steps {
        //sh 'ls -ltr'
        // build the project and create a JAR file
        //sh 'cd ${DOTNET_CLI_HOME} && dotnet restore'
	//sh 'dotnet restore'
      //}
    //}
    stage('Publish') {
	steps {
	  sh 'dotnet publish --configuration Release --output /home/ubuntu/publish'
	}
    }
    stage('Deploy') {
        steps {
	  sh 'dotnet run /home/ubuntu/publish/webapp.dll'
            }
        }
  }
 }
