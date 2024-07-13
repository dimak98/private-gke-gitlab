resource "google_secret_manager_secret" "secret_1" {
  secret_id = "secret-1"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "secret_1_version" {
  secret      = google_secret_manager_secret.secret_1.id
  secret_data = "secret-1"
}

resource "google_secret_manager_secret_iam_member" "secret_access" {
  secret_id = google_secret_manager_secret.secret_1.secret_id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:tf-svc@${var.project_id}.iam.gserviceaccount.com"
}