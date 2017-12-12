backend "file" {
  path = "/var/lib/vault"
}

listener "tcp" {
  address = "0.0.0.0:8200"
  tls_cert_file = "/etc/vault/vault.crt"
  tls_key_file = "/etc/vault/vault.key"
}
