#!/bin/bash

curl "http://localhost:4741/wines/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
