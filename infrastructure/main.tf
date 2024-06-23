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