# Day 08 – Terraform `count` and `for_each`

Created multiple storage accounts from one resource block using `count` and `for_each`.

## `count`

Creates resources by index (`0`, `1`, `2`).

```hcl
count = length(var.storage_account_name)
name  = var.storage_account_name[count.index]
```

Reference: `azurerm_storage_account.example[0]`

Removing an item from the middle of the list can recreate later resources.

## `for_each`

Creates resources by name, not by index.

```hcl
for_each = toset(var.storage_account_name)
name     = each.value
```

Reference: `azurerm_storage_account.example["tech11"]`

Safer when items have unique names. This lesson uses `for_each`.

## Output

A `for_each` resource is a map, so names are collected with a `for` expression:

```hcl
output "storage_account_name" {
  value = [for i in azurerm_storage_account.example : i.name]
}
```
