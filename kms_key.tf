resource "aws_kms_key" "kms_key" {
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
  enable_key_rotation      = true
  key_usage                = "ENCRYPT_DECRYPT"
  multi_region             = false
  deletion_window_in_days  = null
}
