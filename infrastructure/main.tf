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

resource "google_pubsub_schema" "ai-garden-event" {
  name = "ai-garden-event"
  type = "AVRO"
  definition = <<-EOT
    {
    "type": "record",
    "name": "Avro",
    "fields": [
    {
      "name": "sensor_id",
      "type": "string"
    },
    {
      "name": "humidity",
      "type": "float"
    },
    {
        "name":"moisture",
        "type":"float"
    }
    ]
    }
    EOT
}

resource "google_pubsub_topic" "ai-garden-events" {
  name = "ai-garden-events"
    depends_on = [google_pubsub_schema.ai-garden-event]
    schema_settings {
        schema = "projects/ai-garden-427303/schemas/ai-garden-event"
        encoding = "JSON"
  }
}