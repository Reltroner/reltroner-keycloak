FROM quay.io/keycloak/keycloak:24.0.1

# Set environment variables for admin user
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=reltroner123

# Expose default Keycloak port
EXPOSE 8080

# Build Keycloak in production mode
RUN /opt/keycloak/bin/kc.sh build

# Entry point to Keycloak server
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start"]

# Correct JSON array for CMD
CMD ["--hostname=sso.reltroner.com", "--hostname-strict=false", "--hostname-strict-https=false", "--proxy=edge", "--http-enabled=true", "--http-port=8080", "--log-level=INFO"]
