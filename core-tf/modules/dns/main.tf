resource "google_dns_managed_zone" "gitlab_zone" {
  name        = "gitlab-zone"
  dns_name    = "dimak.com."
  description = "Managed zone for GitLab"
}

resource "google_dns_record_set" "gitlab_a_record" {
  name         = "gitlab.dimak.com."
  type         = "A"
  ttl          = 300
  managed_zone = google_dns_managed_zone.gitlab_zone.name

  rrdatas = [var.gke_ingress_ip]
}