# Pelorus DORA Metrics API and Dashboard

Instructions for getting started developing Pelorus

1. Spin up this workspace by entering this repo URL into a Dev Spaces/Eclipse Che instance
1. Once workspace has started run the "pelorus-ui > install" Task to do an `npm install` of dependencies
1. If running Pelorus in a separate cluster
  1. use oc to log into the other cluster
  1. Once logged in, run `oc whoami -t > /tmp/token`
  1. Create an environment variable to point workspace to the Prometheus URL in the other cluster
    ```bash
    echo "export PELORUS_URL=https://<prometheus-route hostname>/api/v1" >> ${PROJECTS_ROOT}/custom-env.sh
    ```
1. Run the "Pelorus API Dev Mode" task
1. Run the "Pelorus UI Dev Mode" task