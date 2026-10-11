output "workspace_preset_lookup_id" {
  description = "Map of id values across all workspace_preset_lookup, keyed the same as var.workspace_preset_lookup except keys with no id are omitted"
  value       = { for k, v in data.coder_workspace_preset.workspace_preset_lookup : k => v.id if v.id != null && length(v.id) > 0 }
}
output "workspace_preset_lookup_default" {
  description = "Map of default values across all workspace_preset_lookup, keyed the same as var.workspace_preset_lookup except keys with no default are omitted"
  value       = { for k, v in data.coder_workspace_preset.workspace_preset_lookup : k => v.default if v.default != null }
}
output "workspace_preset_lookup_description" {
  description = "Map of description values across all workspace_preset_lookup, keyed the same as var.workspace_preset_lookup except keys with no description are omitted"
  value       = { for k, v in data.coder_workspace_preset.workspace_preset_lookup : k => v.description if v.description != null && length(v.description) > 0 }
}
output "workspace_preset_lookup_icon" {
  description = "Map of icon values across all workspace_preset_lookup, keyed the same as var.workspace_preset_lookup except keys with no icon are omitted"
  value       = { for k, v in data.coder_workspace_preset.workspace_preset_lookup : k => v.icon if v.icon != null && length(v.icon) > 0 }
}
output "workspace_preset_lookup_name" {
  description = "Map of name values across all workspace_preset_lookup, keyed the same as var.workspace_preset_lookup except keys with no name are omitted"
  value       = { for k, v in data.coder_workspace_preset.workspace_preset_lookup : k => v.name if v.name != null && length(v.name) > 0 }
}
output "workspace_preset_lookup_parameters" {
  description = "Map of parameters values across all workspace_preset_lookup, keyed the same as var.workspace_preset_lookup except keys with no parameters are omitted"
  value       = { for k, v in data.coder_workspace_preset.workspace_preset_lookup : k => v.parameters if v.parameters != null && length(v.parameters) > 0 }
}
output "workspace_preset_lookup_prebuilds" {
  description = "Map of prebuilds values across all workspace_preset_lookup, keyed the same as var.workspace_preset_lookup except keys with no prebuilds are omitted"
  value       = { for k, v in data.coder_workspace_preset.workspace_preset_lookup : k => one(v.prebuilds) if v.prebuilds != null && length(v.prebuilds) > 0 }
}

