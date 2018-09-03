#!/bin/bash

curl "http://localhost:4741/tastings" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
