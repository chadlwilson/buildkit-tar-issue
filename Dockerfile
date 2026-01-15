FROM almalinux:10-minimal
RUN microdnf -y install gzip tar-1.35-7.el10 && \
    (rpm -qa | grep tar) && \
    curl --fail --location --silent --show-error \
    https://github.com/adoptium/temurin25-binaries/releases/download/jdk-25.0.1%2B8/OpenJDK25U-jre_$(uname -m | sed -e s/86_//g)_linux_hotspot_25.0.1_8.tar.gz --output /tmp/jre.tar.gz && \
    mkdir -p /gocd-jre && \
    QEMU_STRACE=1 tar -xvf /tmp/jre.tar.gz -C /gocd-jre && \
    microdnf -y install gzip tar-1.35-9.el10_1 && \
    QEMU_STRACE=1 tar -xvf /tmp/jre.tar.gz -C /gocd-jre