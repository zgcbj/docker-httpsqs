# docker-httpsqs
---
## Manual httpsqs
[http://zyan.cc/httpsqs/](http://zyan.cc/httpsqs/)
## Manual docker httpsqs
### Pull the docker 
```
docker pull zgcbj/docker-httpsqs
```
### Examples
```
docker run -d -p 8888:8888 --name yourcontainername  -v /local/path:/data bjzgc/httpsqs -p 8888 -x /data -a authkey
#command after bjzgc/httpsqs is command pass to httpsqs in container, don`t use -d
```


