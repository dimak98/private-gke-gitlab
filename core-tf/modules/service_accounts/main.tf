resource "google_service_account" "k8s_secret_accessor" {
  account_id   = "k8s-secret-accessor"
  display_name = "Kubernetes Secret Accessor Service Account"
}

resource "google_project_iam_member" "k8s_secret_accessor_secret_manager" {
  project = var.project_id
  role    = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:${google_service_account.k8s_secret_accessor.email}"
}

resource "google_project_iam_member" "k8s_secret_accessor_workload_identity" {
  project = var.project_id
  role    = "roles/iam.workloadIdentityUser"
  member  = "serviceAccount:${var.project_id}.svc.id.goog[default/k8s-secret-accessor]"
}