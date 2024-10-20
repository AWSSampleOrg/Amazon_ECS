STACK_NAME="StandaloneTaskOnFargate"

aws cloudformation deploy \
	--template-file template.yml \
	--stack-name ${STACK_NAME} \
	--parameter-overrides \
	ProjectPrefix="" \
	VpcId="" \
	PublicSubnetAId="" \
	PublicSubnetCId="" \
	EcsAppImageName="app" \
	--capabilities CAPABILITY_NAMED_IAM
