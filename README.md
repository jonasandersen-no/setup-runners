# setup-runners

Repository that stores a script to setup a github action runner on a ubuntu arm64 VM. (Might be applicable to other distros too)

You will need to get a token from your github organization settings page. See this following line in the script.
```
#Check for this config line on the organiztion runners setup page.
./config.sh --url https://github.com/ORGANIZATION --token SOME_TOKEN
```
You will need to alter the script to use newer binaries of the runner + docker.
