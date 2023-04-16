module "k8s-azure-devops-agents" {
  source         = "../../"

  ado_ext_pat                          = var.ado_ext_pat
  ado_org                              = var.ado_org
  keda_namespace                       = var.keda_namespace
  keda_version                         = var.keda_version
  keda_install                         = var.keda_install
  k8s_ado_agents_namespace_labels      = var.k8s_ado_agents_namespace_labels
  k8s_ado_agents_namespace_annotations = var.k8s_ado_agents_namespace_annotations
}
