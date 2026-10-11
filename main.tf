data "coder_workspace_preset" "workspace_preset_lookup" {
  for_each = var.workspace_preset_lookup

  name        = each.value.name
  default     = each.value.default
  description = each.value.description
  icon        = each.value.icon
  parameters  = each.value.parameters

  dynamic "prebuilds" {
    for_each = each.value.prebuilds != null ? [each.value.prebuilds] : []
    content {
      dynamic "expiration_policy" {
        for_each = prebuilds.value.expiration_policy != null ? [prebuilds.value.expiration_policy] : []
        content {
          ttl = expiration_policy.value.ttl
        }
      }
      instances = prebuilds.value.instances
      dynamic "scheduling" {
        for_each = prebuilds.value.scheduling != null ? [prebuilds.value.scheduling] : []
        content {
          dynamic "schedule" {
            for_each = scheduling.value.schedule
            content {
              cron      = schedule.value.cron
              instances = schedule.value.instances
            }
          }
          timezone = scheduling.value.timezone
        }
      }
    }
  }
}

