
pipeline {
    agent { 
        node {
            label 'ubuntu'
            }
      }
    triggers {
        pollSCM '* * * * *'
    }
        stage(" execute Ansible") {
           steps {
                ansiblePlaybook colorized: true, credentialsId: 'jenkins-agent', disableHostKeyChecking: true, installation: 'Ansible', inventory: 'playbooks/inventory', playbook: 'playbooks/tranfer_file.yaml', vaultTmpPath: ''
            }    
        }    
    }
}

