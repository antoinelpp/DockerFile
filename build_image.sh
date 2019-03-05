docker build -t antoinelpp/DockerFile .
docker run -d=true -e SERVER_URL=https://hephaistos.lpp.polytechnique.fr/teamcity --name=teamcity-docker-agent-fedora-lppic -it antoinelpp/DockerFile &
sleep 300
docker stop teamcity-docker-agent-fedora-lppic 
docker commit teamcity-docker-agent-fedora-lppic antoinelpp/DockerFile
docker rm teamcity-docker-agent-fedora-lppic 
