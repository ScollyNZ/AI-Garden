resource "google_cloud_run_v2_service" "ai-garden-ingress" {
  name     = "ai-garden-ingress"
  location = "australia-southeast1"
  ingress = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      image = "us-docker.pkg.dev/google-samples/containers/gke/hello-app:1.0"
    }
  }
}

resource "google_cloud_run_service_iam_policy" "public-access" {
    service = google_cloud_run_v2_service.ai-garden-ingress.name
    location = google_cloud_run_v2_service.ai-garden-ingress.location
    policy_data = data.google_iam_policy.public-access-policy-data.policy_data
}

data "google_iam_policy" "public-access-policy-data" {
    binding {
        role = "roles/run.invoker"
        members = ["allUsers"]
    }
}