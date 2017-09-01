############################################################
# Dockerfile to build MongoDB container images
# Based on Ubuntu
############################################################

# Set the base image from jeandet
FROM jeandet/teamcity-docker-minimal-agent
LABEL maintainer "Antoine Tavant <antoine.tavant@lpp.polytechnique.fr>"

# Update the repository sources list
#RUN dnf -y update

################## BEGIN INSTALLATION ######################

RUN dnf install -y git openmpi-devel cmake hdf5-openmpi-devel petsc-openmpi-devel hypre* gcc-gfortran module-macros gcc-c++ zlib-devel wget


RUN echo "system.has_qt5=true" >> /opt/buildagent/conf/buildAgent.dist.properties && \
    echo "system.has_gcov=true" >> /opt/buildagent/conf/buildAgent.dist.properties && \
    echo "system.has_clang=true" >> /opt/buildagent/conf/buildAgent.dist.properties && \
    echo "system.has_clazy=true" >> /opt/buildagent/conf/buildAgent.dist.properties && \
    echo "system.has_cppcheck=true" >> /opt/buildagent/conf/buildAgent.dist.properties && \
    echo "system.has_clang_analyzer=true" >> /opt/buildagent/conf/buildAgent.dist.properties && \
    echo "system.has_lcov=true" >> /opt/buildagent/conf/buildAgent.dist.properties && \
    echo "system.has_openmpi=true" >> /opt/buildagent/conf/buildAgent.dist.properties

# Create the default data directory
RUN git clone https://tavant:EG8un\$ah@hephaistos.lpp.polytechnique.fr/rhodecode/GIT_REPOSITORIES/LPP/LPPic2D/LPPic-Xe 
Run mv LPPic-Xe lppic ;\
    cd lppic ; git checkout Developpement ;\
    git pull;\
    mkdir build; cd build ;\
    pwd 

WORKDIR /lppic/build

#--------------------------------------------------------------
                 #LD_LIBRARY_PATH 
#---------------------------------------------------------------
 RUN export LD_LIBRARY_PATH=/usr/lib64/openmpi/lib/
 ENV PATH=${PATH}:/usr/lib64
 RUN export HDF5_DIR=/usr/lib64/openmpi/ 
CMD ["git pull"]
CMD ["module load mpi/openmpi-x86_64"]
CMD ["cmake .. && make clean && make lppic"]
CMD ["/run-services.sh"]
