resource "kubernetes_namespace" "ado-agents" {
  count = var.k8s_ado_agents_create_namespace ? 1 : 0

  metadata {
    annotations = var.k8s_ado_agents_namespace_annotations
    labels      = var.k8s_ado_agents_namespace_labels
    name        = var.k8s_ado_agents_namespace
  }
}

data "kubernetes_namespace" "ado-agents" {
  count = var.k8s_ado_agents_create_namespace ? 0 : 1

  metadata {
    name = var.k8s_ado_agents_namespace
  }
}

resource "kubernetes_secret" "pipeline-auth" {
  count = var.k8s_ado_agents_create_secret ? 1 : 0
  metadata {
    name      = "pipeline-auth"
    namespace = local.ado_namespace
  }

  data = {
    AZP_URL   = var.ado_org
    AZP_TOKEN = var.ado_ext_pat
  }

  type = "Opaque"
}
