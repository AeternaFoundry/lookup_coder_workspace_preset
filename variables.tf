variable "workspace_preset_lookup" {
  description = <<EOT
Map of workspace_preset_lookup, attributes below
Required:
    - name
Optional:
    - default
    - description
    - icon
    - parameters
    - prebuilds (block):
        - expiration_policy (optional, block):
            - ttl (required)
        - instances (required)
        - scheduling (optional, block):
            - schedule (required, block):
                - cron (required)
                - instances (required)
            - timezone (required)
EOT

  type = map(object({
    name        = string
    default     = optional(bool)
    description = optional(string)
    icon        = optional(string)
    parameters  = optional(map(string))
    prebuilds = optional(object({
      expiration_policy = optional(object({
        ttl = number
      }))
      instances = number
      scheduling = optional(object({
        schedule = list(object({
          cron      = string
          instances = number
        }))
        timezone = string
      }))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.workspace_preset_lookup : (
        v.prebuilds == null || (v.prebuilds.scheduling == null || (length(v.prebuilds.scheduling.schedule) >= 1))
      )
    ])
    error_message = "Each schedule list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.workspace_preset_lookup : (
        length(v.name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.workspace_preset_lookup : (
        v.description == null || (length(v.description) >= 0 && length(v.description) <= 128)
      )
    ])
    error_message = "must be between 0 and 128 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.workspace_preset_lookup : (
        v.icon == null || ((length(v.icon) >= 0 && length(v.icon) <= 256))
      )
    ])
    error_message = "all of: must be between 0 and 256 characters (1 further check(s) enforced by the provider, not mirrored here)"
  }
  validation {
    condition = alltrue([
      for k, v in var.workspace_preset_lookup : (
        v.parameters == null || (alltrue([for x in v.parameters : length(x) > 0]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.workspace_preset_lookup : (
        v.prebuilds == null || (v.prebuilds.instances >= 0)
      )
    ])
    error_message = "must be at least 0"
  }
}

