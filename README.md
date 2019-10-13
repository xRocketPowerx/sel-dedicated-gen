# sel-dedicated-gen
Swagger generators for sel-dedicated


## HOW TOs

### ### How TO generate new client with docker

```bash
# without slash on the tail
export DESTINATION=/tmp/sel_dedicated
./generate.sh
```

#### Under the hood

```bash
# clean current generated code
fr -rm $(pwd)/output

# generate
docker run --rm -v $(pwd):/local openapitools/openapi-generator-cli generate -i /local/swagger.json --ignore-file-override='/local/.swagger-codegen-ignore' --http-user-agent "python-sel-dedicated-client" -g python -o /local/output/python --package-name=sel_dedicated_codegen

# COPY generated code
cp -r output/python/README.md ${DESTINATION}/AUTODOCS.md
cp -r output/python/docs/ ${DESTINATION}/docs
cp -r output/python/sel_dedicated_client ${DESTINATION}/

```

### How TO show codegen help

```bash
docker run --rm swaggerapi/swagger-codegen-cli help generate
```

