output "keda_latest_version" {
  value = try(data.github_release.keda[0].release_tag, null)
}
