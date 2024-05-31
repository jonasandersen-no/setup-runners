sudo apt update
sudo apt upgrade
mkdir actions-runner && cd actions-runner
#Check for the latest actions runner on github.
curl -o actions-runner-linux-arm64-2.316.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.316.1/actions-runner-linux-arm64-2.316.1.tar.gz 
tar xzf ./actions-runner-linux-arm64-2.316.1.tar.gz
#Check for this config line on the organiztion runners setup page.
./config.sh --url https://github.com/ORGANIZATION --token SOME_TOKEN
sudo ./svc.sh install
sudo ./svc.sh start

# Install docker (Taken from docker docs)

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
#Check for latest docker compose binary on github.
sudo curl -SL https://github.com/docker/compose/releases/download/v2.27.1/docker-compose-linux-aarch64 -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
