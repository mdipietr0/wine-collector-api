#!/bin/bash
curl "http://localhost:4741/wines/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "wine": {
      "producer": "'"${PRODUCER}"'",
      "name": "'"${NAME}"'",
      "country": "'"${COUNTRY}"'",
      "region": "'"${REGION}"'",
      "color": "'"${COLOR}"'"
    }
  }'

echo
