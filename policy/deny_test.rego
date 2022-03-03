package main

empty(value) {
	count(value) == 0
}

no_violations {
	empty(deny)
}

test_blank_input {
	no_violations with input as {}
}

test_fails_az_sa_replication {
	deny["Storage Account `single` is not using replication GRS"] with input as {"planned_values": {"root_module": {"resources": [{"type": "azurerm_storage_account","values": {"account_replication_type": "LRS","name": "single"}} ]}}}
    deny["Storage Account `multiple_1` is not using replication GRS"] with input as {"planned_values": {"root_module": {"resources": [{"type": "azurerm_storage_account","values": {"account_replication_type": "LRS","name": "multiple_1"}},{"type": "azurerm_storage_account","values": {"account_replication_type": "GRS","name": "multiple_2"}} ]}}}
}
