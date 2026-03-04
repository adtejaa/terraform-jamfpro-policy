output "policy_id" {
  description = "The ID of the created policy"
  value       = jamfpro_policy.policy.id
}

output "policy_name" {
  description = "The name of the created policy"
  value       = jamfpro_policy.policy.name
}

output "category_id" {
  description = "The category ID of the policy"
  value       = jamfpro_policy.policy.category_id
} 

output "site_id" {
  description = "The site ID of the policy"
  value       = jamfpro_policy.policy.site_id
} 