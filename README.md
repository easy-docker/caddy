# caddy
**使用**
```
docker pull ghostry/caddy:2
docker rm -f gcaddy2
docker run -d -p 80:80 --restart=always --name gcaddy2 -v ~/.gcaddy2:/caddy/html ghostry/caddy:2
```
