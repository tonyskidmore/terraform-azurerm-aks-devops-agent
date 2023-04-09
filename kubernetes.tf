resource "kubernetes_namespace" "ado-agents" {
  metadata {

    # TODO: include option for annotations and labels
    # annotations = {
    #   name = "example-annotation"
    # }

    # labels = {
    #   mylabel = "label-value"
    # }

    name = var.k8s_ado_agents_namespace
  }
}

resource "kubernetes_secret" "pipeline-auth" {
  metadata {
    name      = "pipeline-auth"
    namespace = var.k8s_ado_agents_namespace
  }

  data = {
    AZP_URL   = var.ado_org
    AZP_TOKEN = var.ado_ext_pat
  }

  type = "Opaque"
}

resource "kubernetes_manifest" "scaled_deployment" {
  manifest = {
    apiVersion = "keda.sh/v1alpha1"
    kind       = "ScaledJob"

    metadata = {
      name      = "azure-pipelines-scaledjob"
      namespace = var.k8s_ado_agents_namespace

      labels = {
        name = "azure-pipelines-scaledjob"
      }
    }

    spec = {
      triggers = [
        {
          type = "azure-pipelines"
          metadata = {
            poolName                   = var.ado_agent_pool_name
            organizationURLFromEnv     = "AZP_URL"
            personalAccessTokenFromEnv = "AZP_TOKEN"
          }
        }
      ]
      jobTargetRef = {
        activeDeadlineSeconds = 14400
        template = {
          spec = {
            restartPolicy = "Never"
            containers = [
              {
                name            = "azure-pipelines-agent"
                image           = var.k8s_ado_agent_image
                imagePullPolicy = "Always"
                envFrom = [
                  {
                    secretRef = {
                      name = "pipeline-auth"
                    }
                  }
                ]
              }
            ]
          }
        }
      }
      pollingInterval            = 10
      successfulJobsHistoryLimit = 5
      failedJobsHistoryLimit     = 5
      maxReplicaCount            = 30
      rollout = {
        strategy = "gradual"
      }
    }
  }
}
