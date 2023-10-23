# OAuth with OpenShift

```bash
cat << EOF | oc apply -f -
kind: OAuthClient
apiVersion: oauth.openshift.io/v1
metadata:
 name: developer-intelligence
secret: "hello-there" 
redirectURIs:
 - "https://cgruver-pelorus-workspace-pelorus-metrics.apps.sno-2.clg.lab" 
grantMethod: prompt
EOF
```

```bash
export OPENSHIFT_ID=developer-intelligence
export OPENSHIFT_SECRET="+03/pWr4sFvxrcm29hwnXLREWjFfmW2toTCUyNcLytc="
. ${PROJECTS_ROOT}/env-tmp/set-env.sh ; export NODE_EXTRA_CA_CERTS=/tmp/node-extra-certificates/ca.crt ; npm run dev
```