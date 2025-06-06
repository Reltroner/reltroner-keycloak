FROM quay.io/keycloak/keycloak:24.0.1

ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=reltroner123

EXPOSE 8080

RUN /opt/keycloak/bin/kc.sh build

ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", 
  "--hostname=sso.reltroner.com", 
  "--hostname-strict=false", 
  "--hostname-strict-https=false", 
  "--proxy=edge", 
  "--http-enabled=true", 
  "--http-port=8080", 
  "--log-level=INFO"
]
