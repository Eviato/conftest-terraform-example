package main

has_field(obj, field) {
	obj[field]
}

deny[msg] {
    changeset := input.planned_values.root_module.resources[i]
    changeset.type == "azurerm_storage_account"
    changeset.values.account_replication_type != "GRS"
    msg := sprintf("Storage Account `%v` is not using replication GRS", [changeset.values.name])
}