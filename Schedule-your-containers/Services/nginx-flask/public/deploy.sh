STACK_NAME="EcsOnFargate"

aws cloudformation deploy \
	--template-file template.yml \
	--stack-name ${STACK_NAME} \
	--parameter-overrides \
	ProjectPrefix="" \
	VpcId="" \
	PublicSubnetAId="" \
	PublicSubnetCId="" \
	EcsWebContainerPort=80 \
	EcsAppContainerPort=3000 \
	EcsAppImageName="app" \
	--capabilities CAPABILITY_NAMED_IAM
