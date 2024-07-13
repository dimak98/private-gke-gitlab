output "dns_record_name" {
  value = google_dns_record_set.gitlab_a_record.name
}
