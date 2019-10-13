#!/bin/bash

set -exo pipefail

if [[ -z ${DESTINATION} ]]; then
  >&2 echo "\$DESTINATION env variable not set"
  exit 1
else 
  echo "\$DESTINATION: $DESTINATION"
fi


rm -fr output/

docker run --rm -v $(pwd):/local openapitools/openapi-generator-cli generate \
  -i /local/swagger.json --ignore-file-override='/local/.swagger-codegen-ignore' \
  --http-user-agent "python-sel-dedicated-client" -g python -o /local/output/python \
  --package-name=sel_dedicated_codegen

cp -r output/python/sel_dedicated_codegen ${DESTINATION}/
cp -r output/python/docs/ ${DESTINATION}/docs
cp -r output/python/README.md ${DESTINATION}/AUTODOCS.md
