locals {
  prefix                = var.prefix != "" ? "${var.prefix}-" : ""
  service_accounts_list = [for name in var.names : google_service_account.service_accounts[name]]
  emails_list           = [for account in local.service_accounts_list : account.email]
  iam_emails_list       = [for email in local.emails_list : "serviceAccount:${email}"]
  names                 = toset(var.names)
  name_role_pairs       = setproduct(local.names, toset(var.project_roles))
  project_roles_map_data = zipmap(
    [for pair in local.name_role_pairs : "${pair[0]}-${pair[1]}"],
    [for pair in local.name_role_pairs : {
      name = pair[0]
      role = pair[1]
    }]
  )
}

# create service accounts
resource "google_service_account" "service_accounts" {
  for_each     = local.names
  account_id   = "${local.prefix}${lower(each.value)}"
  display_name = var.display_name
  description  = var.description
  project      = var.project_id
}
/*
# service account roles binding
resource "google_service_account_iam_binding" "sa-roles" {
  for_each = toset(var.neustar_gcp_groups)

  service_account_id = "neustar-test@mta-mta-dev-dn-8430.iam.gserviceaccount.com"
  role = var.sa_role

  members = [
    "group:${each.key}"
    ]
}
*/
# project roles binding
resource "google_project_iam_binding" "project-roles" {
  for_each = local.project_roles_map_data

  project = element(
    split(
      "=>",
      each.value.role
    ),
    0,
  )

  role = element(
    split(
      "=>",
      each.value.role
    ),
    1,
  )

  members = [
    "serviceAccount:${google_service_account.service_accounts[each.value.name].email}"
    ]
}