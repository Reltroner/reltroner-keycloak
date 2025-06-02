FROM quay.io/keycloak/keycloak:24.0.1

ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=reltroner123

ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev", "--hostname=sso.reltroner.com", "--hostname-strict=false", "--hostname-strict-https=false"]
