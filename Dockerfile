FROM quay.io/keycloak/keycloak:24.0.1

# Switch ke user root untuk copy theme
USER root

# Copy custom theme
COPY themes/reltroner-theme /opt/keycloak/themes/reltroner-theme

# Kembalikan ke user keycloak (best practice)
USER keycloak

EXPOSE 8080

ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]
