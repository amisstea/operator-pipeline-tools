FROM registry.access.redhat.com/ubi8/python-39:latest

ENV SUMMARY="Tools for Red Hat operator certification pipelines" \
    DESCRIPTION="Tools for Red Hat operator certification pipelines"

LABEL summary="$SUMMARY" \
      description="$DESCRIPTION" \
      io.k8s.description="$DESCRIPTION" \
      io.k8s.display-name="operator-pipeline-tools" \
      name="amisstea/operator-pipeline-tools" \
      version="1" \
      maintainer="Alex Misstear <amisstea@redhat.com>"

RUN OPM_URL="https://github.com/operator-framework/operator-registry/releases/download/v1.17.1/linux-amd64-opm" && \
    JQ_URL="https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64" && \
    BIN_DIR="$APP_ROOT/bin" && \
    curl -L -o $BIN_DIR/opm $OPM_URL && \
    curl -L -o $BIN_DIR/jq $JQ_URL && \
    chmod +x $BIN_DIR/opm $BIN_DIR/jq

RUN pip install yq
