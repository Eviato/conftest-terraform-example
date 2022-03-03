conftest:
	terraform init > /dev/null
	terraform plan -out plan.tfplan > /dev/null
	terraform show -json plan.tfplan > plan.json
	conftest test plan.json