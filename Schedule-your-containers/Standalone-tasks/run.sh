ECSCLUSTER_ARN=""
ECSTASKDEF_ARN=""

SUBNET_ID=""
SG_ID=""
NETWORK_CONFIG="awsvpcConfiguration={subnets=[${SUBNET_ID}],securityGroups=[${SG_ID}],assignPublicIp=ENABLED}"

aws ecs run-task \
    --cluster ${ECSCLUSTER_ARN} \
    --task-definition ${ECSTASKDEF_ARN} \
    --network-configuration "${NETWORK_CONFIG}" \
    --launch-type FARGATE
