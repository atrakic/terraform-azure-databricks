package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestBasicExample(t *testing.T) {
	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: ".",

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"notebook_filename": "../src/notebook-getting-started.py",
		},

		// Environment variables to set when running Terraform
		EnvVars: map[string]string{
			"TF_LOG": "ERROR",
		},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	//terraform.InitAndApply(t, terraformOptions)
	terraform.InitAndPlan(t, terraformOptions)
}
