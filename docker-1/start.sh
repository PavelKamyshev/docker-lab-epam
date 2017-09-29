docker build -t mynginx -f nginx.Dockerfile .
docker build -t mytomcat -f tomcat.Dockerfile .
docker build -t mywebapp -f webapp.Dockerfile .
docker run --rm -d --name mywebapp mywebapp
docker run --rm -d --name mynginx --link mywebapp:mywebapp -p 80:80 nginx #
