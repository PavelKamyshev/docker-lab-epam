docker build -t mytomcat -f tomcat.Dockerfile .
docker build -t mywebapp -f webapp.Dockerfile .
docker build -t mynginx -f nginx.Dockerfile .
docker run -d --name mywebapp mywebapp
docker run -d -P --volumes-from mywebapp --name mytomcat mytomcat
docker run --rm -d --name mynginx --link mytomcat -p 80:80 mynginx
