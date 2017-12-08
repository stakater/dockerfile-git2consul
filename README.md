# Dockerfile-git2consul
Dockerfile image for git2consul
<h3>git2consul </h3> 
`git2consul` takes one or more git repositories and then map them on to the consul server. Target is to read configurations from git repo and save them as key value pairs in consul server. <br>
Any change in git repo is mapped on to the consul server after every 1 minute. 
<h3>Usage</h3>
To run the docker container of `git2consul`, set command in environment variable `command`.
<br>E.g:<br> ```docker run -d -e COMMAND="git2consul --endpoint 127.0.0.1 --port 80 --config-file /home/git2consul/config.json" -v /home/git2consul/:/home/git2consul stakater/git2consul:0.12.13```
<br>

where endpoint is the location of the consul server, port is the consul server port and config.json file contains the information of git repository and some other configurations of `git2consul`.
<br>
Example `config.json`:  
```
{
  "version": "1.0",
  "repos" : [{
    "name" : "keyValue pairs",
    "url" : "your git repo link",
    "branches" : ["dev"],
    "include_branch_name" : false,
    "ignore_repo_name" : true,
    "ignore_file_extension" : true,
    "expand_keys": true,
    "hooks": [{
      "type" : "polling",
      "interval" : "1"
    }]
  }]
}
```
You can learn more about `git2consul` configurations [here](https://github.com/breser/git2consul).<br> 
If you do not set command in environment variable `command`, container will run default command, which is as follow: <br>
`git2consul --endpoint 127.0.0.1 --port 80 --config-file /home/git2consul/config.json`
<h3>Available Versions</h3>
`v0.12.13`
<h3>Layers</h3>
alpine:3.5 > stakater/base-alpine:3.5 > stataker/node/6.9 > stakater/git2consul
