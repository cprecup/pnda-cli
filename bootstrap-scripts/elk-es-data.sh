#!/bin/bash -v

# This script runs on instances with a node_type tag of "elk-es-data"
# It sets the roles that determine what software is installed
# on this instance by platform-salt scripts and the minion
# id and hostname

# The pnda_env-<cluster_name>.sh script generated by the CLI should
# be run prior to running this script to define various environment
# variables

# Parameters:
#  $1 - node index for this datanode - as this node type may be horizontally scaled, should start at 0.
#  $2 - number of master nodes in this cluster.

set -e

cat >> /etc/salt/grains <<EOF
roles:
  - elk-es-data
num_of_masters: $2
master_name: $PNDA_CLUSTER-elk-es-master-
EOF

cat >> /etc/salt/minion <<EOF
id: $PNDA_CLUSTER-elk-es-data-$1
EOF

echo $PNDA_CLUSTER-elk-es-data-$1 > /etc/hostname
hostname $PNDA_CLUSTER-elk-es-data-$1

service salt-minion restart
