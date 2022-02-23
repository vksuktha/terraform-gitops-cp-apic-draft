module "apic" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-cp-apic-operator.git"

  gitops_config = module.gitops.gitops_config
  git_credentials = module.gitops.git_credentials
  server_name = module.gitops.server_name
  catalog = module.cp_catalogs.catalog_ibmoperators
  channel = module.cp4i-dependencies.apic.channel
  platform_navigator_name = module.cp_platform_navigator.name
}