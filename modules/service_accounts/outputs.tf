output "service_accounts" {
  description = "Service account resources as list."
  value       = local.service_accounts_list
}

output "service_accounts_map" {
  description = "Service account resources by name."
  value       = google_service_account.service_accounts
}

output "emails" {
  description = "Service account emails by name."
  value       = zipmap(var.names, local.emails_list)
}

output "iam_emails" {
  description = "IAM-format service account emails by name."
  value       = zipmap(var.names, local.iam_emails_list)
}

output "emails_list" {
  description = "Service account emails as list."
  value       = local.emails_list
}

output "iam_emails_list" {
  description = "IAM-format service account emails as list."
  value       = local.iam_emails_list
}