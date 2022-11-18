# Use of Jenkinsfile and Dockerfile

## Prerequisites:

### A) Jenkins installed on the host

```bash
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update
sudo apt-get install jenkins
systemctl start jenkins.service
```

### B) Configure the webhook on GitHub

In order the webhook to work (meaning triggering build process)
we have to set the GitHub webhook our own cloned repo, so -

1. Do the following

   - clone the repo
   - upload it to your git
   - got to the repo settings
   - click the Webhooks tab
   - from your cli on your pc, run `ngrok http 8080`
   - you should get an address like `https://XXXXXXXX.ngrok.io/github-webhook/`
   - add webhook you got from `ngrok` with the ending `/github-webhook/`
   - leave all defaults and Push "Add webhook"

2. Change anything in the code and commit & push
   And you could see on your jenkins machine the auto rebuild and run

## Points to take into consideration

- Storage - make sure the host can store Jenkins and the repo and the artifact
- Security - make sure to close `ngrok` app but if we expose our host to the internet
- Maintainability - once Jenkins is installed on the host we are good to go
  the main problem is that we have to update each time the webhook on our github repo

Note: we can always pay for a fix URL
