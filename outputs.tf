output "service_account_emails_list_mta" {
  description = "The service account emails."
  value       = module.service_accounts_mta.emails
}

output "service_account_emails_list_kp" {
  description = "The service account emails."
  value       = module.service_accounts_kp.emails
}