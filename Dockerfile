FROM lsiobase/alpine:edge

# set version label
ARG BUILD_DATE
ARG VERSION

LABEL build_version="PJ's Non-Commercial OpenVPN version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="pjwaskiewicz"

RUN \
 echo "**** install packages ****" && \
 apk add --no-cache \
	bridge-utils \
	iproute2 \
	iptables \
	lzo \
	openvpn \
	net-tools && \
 echo "**** ensure home folder for abc user set to /config ****" && \
 usermod -d /config abc && \
 rm -rf /tmp/*

# add local files
COPY /root /

# ports and volumes
EXPOSE 1194/udp
VOLUME /config

# TODO:
# 	- Add Google Authenticator MFA support
#	- Automatically derive new openvpn package version?
#	- Update README.md
#	- Push initial github update
#	- Push to dockerhub
