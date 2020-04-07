# caddy
**使用**
```
docker pull ghostry/caddy
docker rm -f gcaddy
docker run -d -p 80:80 --restart=always --name gcaddy -v ~/.gcaddy:/caddy/html ghostry/caddy
```
