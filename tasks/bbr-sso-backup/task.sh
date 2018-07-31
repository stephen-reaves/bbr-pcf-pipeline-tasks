#!/bin/bash -eu

. "$(dirname $0)"/../../scripts/export-director-metadata

pushd sso-backup-artifact
  ../binary/bbr deployment --target "${BOSH_ADDRESS}" \
  --username "${BOSH_CLIENT}" \
  --deployment "Pivotal_Single_Sign-On_Service-3d1e97af31fba5915df8" \
  --ca-cert "${BOSH_CA_CERT_PATH}" \
  backup --with-manifest

  tar -cvf sso-backup.tar -- *
popd
