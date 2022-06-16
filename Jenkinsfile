pipeline {
    agent any
     parameters {
        string(defaultValue: 'codingdelightph',  name: 'DOCKER_USERNAME', trim: true)
        string(defaultValue: '',  name: 'DOCKER_PASSWORD',  trim: true)
        string(defaultValue: 'https://github.com/codingdelightph/java-pipeline.git',  name: 'GITHUB_URL',  trim: true)
    }
    stages {
        stage("Clean Up"){
            steps {
                deleteDir()
            }
        }
        stage("Clone Repo"){
            steps {
                 sh "git clone ${GITHUB_URL}"
            }
        }
        stage("Build"){
            steps {
                dir("java-pipeline") {
                    sh "stages/02_build.sh"
                }
            }
        }
        stage("Test"){
            steps {
                dir("java-pipeline") {
                     sh "stages/03_test.sh"
                }
           }
        }
        
        stage("Build Docker Image"){
            steps {
                   
               
                dir("java-pipeline") {
                     sh "chmod u+x stages/04_archive.sh"
                     sh "stages/04_archive.sh"
                }
           }
        }
        
        stage("Deploy"){
            steps {
                   
               
                dir("java-pipeline") {
                     sh "chmod u+x stages/05_deploy.sh"
                     sh "stages/05_deploy.sh"
                }
           }
        }
    }
}
