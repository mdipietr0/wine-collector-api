#!/bin/bash
curl "http://localhost:4741/tastings/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "tasting": {
      "wine_id": "'"${WINEID}"'",
      "user_id": "'"${USERID}"'",
      "appearance": "'"${APPEARANCE}"'",
      "nose": "'"${NOSE}"'",
      "palate": "'"${PALATE}"'",
      "conclusions": "'"${CONCLUSIONS}"'"
    }
  }'

echo
