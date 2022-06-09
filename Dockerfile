FROM adguard/adguardhome:latest
COPY config.yml /opt/adguardhome/conf/AdGuardHome.yaml
EXPOSE 80
EXPOSE 53
