# Terraform: What I Learned

I created a virtual machine (VM) using Terraform and learned how variable types define the values a configuration accepts.

## Data types

| Type | What I learned | Example |
| --- | --- | --- |
| `bool` | Stores `true` or `false` | `true` |
| `string` | Stores text | `"dev"` |
| `number` | Stores a number | `2` |
| `list(string)` | Stores an ordered collection of strings | `["dev", "test"]` |
| `tuple([string, number, bool])` | Stores an ordered collection where each position can have a different type | `["dev", 2, true]` |

Terraform calls the boolean type `bool`. A list has one element type, while a tuple defines the type of each position.