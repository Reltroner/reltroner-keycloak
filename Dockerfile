FROM quay.io/keycloak/keycloak:24.0.1

# Set environment variables for admin user
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=reltroner123

# (Optional) Expose port 8080 (Keycloak default)
EXPOSE 8080

# Build Keycloak in production mode (required step)
RUN /opt/keycloak/bin/kc.sh build

# Use exec form ENTRYPOINT for easier arg overrides
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start"]

# Default command/args (can be overridden via Docker run or Railway settings)
CMD [
  "--hostname=sso.reltroner.com",
  "--hostname-strict=false",
  "--hostname-strict-https=false",
  "--proxy=edge",
  "--http-enabled=true",
  "--http-port=8080",
  "--log-level=INFO"
]
