module "aks-devops-agents" {
  source      = "../../"
  ado_ext_pat = var.ado_ext_pat
  ado_org     = var.ado_org
}
