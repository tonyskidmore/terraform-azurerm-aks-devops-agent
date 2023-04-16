ado_ext_pat  = "dummy"
ado_org      = "https://dev.azure.com/ado-tests"
keda_version = "latest"
# keda_version = "2.9.3"
keda_install   = true
keda_namespace = "keda-namespace"
k8s_ado_agents_namespace_labels = {
  "keda.sh/scaling-class" = "keda"
}
