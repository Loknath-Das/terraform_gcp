provider "google" {
  project = var.project_id
  region  = var.region
}

# Following block provisions the Cloud SQL Database
resource "google_sql_database_instance" "sql_instance" {
  name             = var.db_instance_name
  database_version = var.db_version
  region           = var.region

  settings {
    tier = var.db_tier
  }
}

resource "google_sql_database" "sql_database" {
  name     = var.db_name
  instance = google_sql_database_instance.instance.name
}

resource "google_sql_user" "sql_user" {
  name     = var.db_user_name
  instance = google_sql_database_instance.instance.name
  password = var.db_user_password
}

# Following block provisions the Cloud Run Service

resource "google_cloud_run_service" "run_service" {
  name     = var.cloud_run_service_name
  location = var.region

  template {
    spec {
      containers {
        image = var.cloud_run_image
        env {
          name  = "DB_HOST"
          value = google_sql_database_instance.instance.connection_name
        }
        env {
          name  = "DB_USER"
          value = google_sql_user.user.name
        }
        env {
          name  = "DB_PASS"
          value = google_sql_user.user.password
        }
        env {
          name  = "DB_NAME"
          value = google_sql_database.database.name
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

# Following block provisions the HTTPS Load Balancer

resource "google_compute_global_address" "global_address" {
  name = var.lb_ip_name
}

resource "google_compute_url_map" "url_map" {
  name            = var.url_map_name
  default_service = google_cloud_run_service.service.status[0].url
}

resource "google_compute_target_http_proxy" "http_proxy" {
  name   = var.http_proxy_name
  url_map = google_compute_url_map.default.self_link
}

resource "google_compute_forwarding_rule" "forwarding_rule" {
  name                  = var.forwarding_rule_name
  target                = google_compute_target_http_proxy.default.self_link
  port_range            = "80"
  load_balancing_scheme = "EXTERNAL"
  ip_address            = google_compute_global_address.default.address
}
