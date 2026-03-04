output "policy_id" {
  description = "The ID of the created policy"
  value       = jamfpro_policy.policy.id
}

output "policy_name" {
  description = "The name of the created policy"
  value       = jamfpro_policy.policy.name
}
