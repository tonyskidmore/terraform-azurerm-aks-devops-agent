resource "kubernetes_secret" "pipeline-auth" {
  metadata {
    name = "pipeline-auth"
    #TODO: create namespace
    #checkov:skip=CKV_K8S_21:"The default namespace should not be used"
    namespace = "default"
  }

  data = {
    AZP_URL   = var.ado_org
    AZP_TOKEN = var.ado_ext_pat
  }

  type = "Opaque"
}
