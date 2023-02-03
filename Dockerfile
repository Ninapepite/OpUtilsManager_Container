FROM debian:11.6
LABEL org.opencontainers.image.authors="github@ninapepite"

ENV DEBIAN_FRONTEND noninteractive
RUN apt update -y && apt upgrade -y
RUN apt install wget unzip snmp -y

RUN wget "https://www.manageengine.com/products/oputils/83624731/ManageEngine_OpUtils_64bit.bin"
COPY install.sh /
RUN chmod +x ManageEngine_OpUtils_64bit.bin && chmod +x install.sh
RUN ./install.sh
RUN rm ManageEngine_OpUtils_64bit.bin

COPY start-oputils.sh /
RUN chmod +x /start-oputils.sh
ENTRYPOINT ["/start-oputils.sh"]

EXPOSE 8060