output "name" {
  value = replace(data.aws_availability_zones.this.zone_ids[0], "/-az\\d+$/", "")
}
