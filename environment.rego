package terraform.environment

import rego.v1

deny := [msg |
    some resource in input.plan.resource_changes

    resource.type == "terraform_data"
    resource.mode == "managed"
    resource.change.after != null

    environment := object.get(resource.change.after.input, "environment", "")
    environment != "dev"

    msg := sprintf(
        "%s must use environment 'dev'; received '%s'.",
        [resource.address, environment]
    )
]
