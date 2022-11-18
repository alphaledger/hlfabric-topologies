#!/bin/bash
set -e
set -x

export FABRIC_CA_CLIENT_TLS_CERTFILES=/tmp/crypto-material/cas/org3/ca-tls/ca-cert.pem
export FABRIC_CA_CLIENT_HOME=/tmp/crypto-material/cas/org3/ca-tls-admin
fabric-ca-client enroll -d -u https://org3-ca-tls-admin:org3-ca-tls-adminpw@0.0.0.0:7054
fabric-ca-client register -d --id.name peer1-org3 --id.secret peer1PW --id.type peer -u https://0.0.0.0:7054
fabric-ca-client register -d --id.name peer2-org3 --id.secret peer2PW --id.type peer -u https://0.0.0.0:7054
fabric-ca-client register -d --id.name peer3-org3 --id.secret peer3PW --id.type peer -u https://0.0.0.0:7054