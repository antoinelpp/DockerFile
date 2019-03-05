docker build -t antoinelpp/teamcity-docker-agent-fedora-lppic .
docker run -d=true -e SERVER_URL=https://hephaistos.lpp.polytechnique.fr/teamcity --name=teamcity-docker-agent-fedora-lppic -it antoinelpp/teamcity-docker-agent-fedora-lppic &
sleep 300
docker stop teamcity-docker-agent-fedora-lppic 
docker commit teamcity-docker-agent-fedora-lppic antoinelpp/teamcity-docker-agent-fedora-lppic
docker rm teamcity-docker-agent-fedora-lppic 
