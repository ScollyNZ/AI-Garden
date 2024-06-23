terraform {
    required_providers {
      google = {
        source = "hashicorp/google"
        version = "5.34.0"
      }
    }
}

provider "google" {
    project = "ai-garden-427303"
    region = "australia-southeast1"
    zone = "australia-southeast1"
    credentials = "./keys.json"
}