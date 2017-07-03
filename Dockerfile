FROM jeandet/teamcity-docker-minimal-agent
LABEL maintainer "Antoine Tavant <antoine.tavant@lpp.polytechnique.fr>"

RUN dnf install -y git openmpi-devel cmake hdf5-openmpi-devel petsc-openmpi-devel hypre* gcc-gfortran module-macros gcc-c++ zlib-devel wget


RUN echo "system.has_qt5=true" >> /opt/buildagent/conf/buildAgent.dist.properties && \
    echo "system.has_gcov=true" >> /opt/buildagent/conf/buildAgent.dist.properties && \
    echo "system.has_clang=true" >> /opt/buildagent/conf/buildAgent.dist.properties && \
    echo "system.has_clazy=true" >> /opt/buildagent/conf/buildAgent.dist.properties && \
    echo "system.has_cppcheck=true" >> /opt/buildagent/conf/buildAgent.dist.properties && \
    echo "system.has_clang_analyzer=true" >> /opt/buildagent/conf/buildAgent.dist.properties && \
    echo "system.has_lcov=true" >> /opt/buildagent/conf/buildAgent.dist.properties && \
    echo "system.has_openmpi=true" >> /opt/buildagent/conf/buildAgent.dist.properties


CMD ["/run-services.sh"]
