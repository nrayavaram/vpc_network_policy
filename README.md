# vpc_network

# Secret_Manager_policies


**Sentinel file "google_check_mtu.sentinel" is having code to deploy the policies. In order to check the value of MTU is 1500 , We need to validate  policy successfully.**

1.the purpose of this policy is to validate the value of the MTU.

Used Variables :
----------------
messages: It is being used to hold the complete message of policies violation to show to the user.

Used Maps :
-----------
allResources: This is the map, being used to map the all resourses regarding to "vpc-network".

control statements: here we are looping and assigning the all the resourses into two parameters 
address => The key inside of resource_changes section for particular GCP Resource in tfplan mock
rc => The value of address key inside of resource_changes section for particular GCP Resource in tfplan mock

condition: if condition is comparing the value of mtu is not 1500 it will generate appropriate message to show the users.


**Terraform version**
Terraform v1.0.7

**sentinel versions**
Sentinel v0.18.4



modules to import:
------------------
import "tfplan-functions"
import "strings"
import "types"


Steps to follow :
-----------------
1.Read the customer requirments.
2..Generate the mocks using terraform code.
3.write the policy based on resourses section in mock-tfplan-v2.sentinel file.
4.run the test file using the command "sentinel apply -trace google_check_mtu.sentinel"
5.maintain the test folder with test cases files
6.run the test cases using the command 
  example :sentinel test google_check_mtu.sentinel
PASS - google_check_mtu.sentinel

  PASS - test/google_check_mtu/fail.hcl

  PASS - test/google_check_mtu/null.hcl

  PASS - test/google_check_mtu/pass.hcl

7.make the test cases should be pass.
