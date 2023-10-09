

/opt/keycloak/bin/kcadm.sh config credentials --server http://localhost:8081 --realm master --user admin --password admin
/opt/keycloak/bin/kcadm.sh create realms -s realm=pelorus -s enabled=true -o
/opt/keycloak/bin/kcadm.sh create users -r pelorus -s username=pelorus-metrics -s enabled=true
./kcadm.sh set-password -r pelorus --username pelorus-metrics --new-password pelorus
./kcadm.sh create clients -r pelorus -s clientId=pelorus-client -s publicClient="true"  -s "redirectUris=[\"http://localhost:8080/*\"]" -s enabled=true
./kcadm.sh create roles -r pelorus -s name=pelorus-metrics
./kcadm.sh add-roles --uusername pelorus-metrics --rolename pelorus-metrics -r pelorus
