module "dev_cluster" {
  source = "github.com/cloud-native-toolkit/terraform-ocp-login.git"

  server_url = var.server_url
  login_user = var.cluster_username
  login_password = var.cluster_password
  login_token = ""
}

resource null_resource output_kubeconfig {
  provisioner "local-exec" {
    command = "echo '${module.dev_cluster.platform.kubeconfig}' > .kubeconfig"
  }
}
