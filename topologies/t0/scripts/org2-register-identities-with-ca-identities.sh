#!/bin/bash
set -e
set -x

export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/crypto-material/cas/org2/ca-identities/ca-cert.pem
export FABRIC_CA_CLIENT_HOME=/tmp/crypto-material/cas/org2/ca-identities-admin
fabric-ca-client enroll -d -u https://org2-ca-identities-admin:org2-ca-identities-adminpw@0.0.0.0:7054
fabric-ca-client register -d --id.name peer1-org2 --id.secret peer1PW --id.type peer -u https://0.0.0.0:7054
fabric-ca-client register -d --id.name admin-org2 --id.secret org2AdminPW --id.type admin -u https://0.0.0.0:7054
fabric-ca-client register -d --id.name user-org2 --id.secret org2UserPW --id.type user -u https://0.0.0.0:7054
fabric-ca-client register -d --id.name client-org2 --id.secret org2UserPW --id.type client -u https://0.0.0.0:7054