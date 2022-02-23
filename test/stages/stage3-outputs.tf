
resource null_resource write_outputs {
  provisioner "local-exec" {
    command = "echo \"$${OUTPUT}\" > gitops-output.json"

    environment = {
      OUTPUT = jsonencode({
        name        = module.apic_instance.name
        branch      = module.apic_instance.branch
        namespace   = module.apic_instance.namespace
        server_name = module.apic_instance.server_name
        layer       = module.apic_instance.layer
        layer_dir   = module.apic_instance.layer == "infrastructure" ? "1-infrastructure" : (module.apic_instance.layer == "services" ? "2-services" : "3-applications")
        type        = module.apic_instance.type
      })
    }
  }
}
