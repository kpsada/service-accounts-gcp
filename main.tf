module "service_accounts_mta" {
  source        = "./modules/service_accounts"
  project_id    = "mta-mta-dev-dn-8430"
  prefix        = "neustar"
  names         = ["test-3"]
  neustar_gcp_groups = ["alpha@cloud86.ca", "gamma@cloud86.ca"]
  sa_role      = "roles/iam.serviceAccountUser"
  project_roles = [
#    "mta-mta-dev-dn-8430=>roles/compute.admin",
    "mta-mta-dev-dn-8430=>roles/accessapproval.viewer",
  ]
}

module "service_accounts_kp" {
  source        = "./modules/service_accounts"
  project_id    = "kaushalpatel-terraform"
  prefix        = "neustar"
  names         = ["kpatel"]
  neustar_gcp_groups = ["alpha@cloud86.ca", "gamma@cloud86.ca"]
  sa_role      = "roles/iam.serviceAccountUser"
  project_roles = [
    "kaushalpatel-terraform=>roles/compute.admin",
#    "kaushalpatel-terraform=>roles/accessapproval.viewer",
  ]
}