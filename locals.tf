locals {
  keda_version = var.keda_version == "latest" ? data.github_release.keda[0].release_tag : var.keda_version
}
