#/bin/bash -e

EMAIL="${2}"
DOMAINS="${3}"
#use http-01 for http and tls-sni-01 for ssl
CHALLENGES="${4}"

DOMAIN_MAIN="$(echo $DOMAINS | sed 's/,.*//')"
SECRET_NAMESPACE="${SECRET_NAMESPACE:-default}"
SECRET_NAME_PREFIX="${SECRET_NAME_PREFIX:-letsencrypt}"
SECRET_NAME="${SECRET_NAME_PREFIX}-${1}"

echo "Generating certificate ${DOMAIN}"
letsencrypt \
  --non-interactive \
  --agree-tos \
  --standalone \
  --standalone-supported-challenges "${CHALLENGES}" \
  --email "${EMAIL}" \
  --domains "${DOMAINS}" \
  --keep-until-expiring \
  certonly

echo "Generating kubernetes secret ${SECRET_NAME} (namespace ${SECRET_NAMESPACE})"
(cat << EOF
apiVersion: v1
kind: Secret
metadata:
  name: "${SECRET_NAME}"
  namespace: "${SECRET_NAMESPACE}"
type: Opaque
data:
  cert.pem: "$(cat /etc/letsencrypt/live/${DOMAIN_MAIN}/cert.pem | base64 --wrap=0)"
  chain.pem: "$(cat /etc/letsencrypt/live/${DOMAIN_MAIN}/chain.pem | base64 --wrap=0)"
  fullchain.pem: "$(cat /etc/letsencrypt/live/${DOMAIN_MAIN}/fullchain.pem | base64 --wrap=0)"
  privkey.pem: "$(cat /etc/letsencrypt/live/${DOMAIN_MAIN}/privkey.pem | base64 --wrap=0)"
EOF
) > "${SECRET_NAMESPACE}-${SECRET_NAME}.yml"
kubectl apply -f "${SECRET_NAMESPACE}-${SECRET_NAME}.yml"
