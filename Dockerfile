FROM quay.io/keycloak/keycloak:24.0.1

ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=reltroner123

# Build Keycloak to production mode
RUN /opt/keycloak/bin/kc.sh build

# Start Keycloak with custom hostname and without HTTPS enforcement (for Railway)
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", \
  "--hostname=sso.reltroner.com", \
  "--hostname-strict=false", \
  "--hostname-strict-https=false", \
  "--proxy=edge"]
