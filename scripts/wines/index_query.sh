#!/bin/bash

curl "http://localhost:4741/wines?${KEY}=${VALUE}" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
