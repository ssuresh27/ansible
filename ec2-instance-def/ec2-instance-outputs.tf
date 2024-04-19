# # EC2 Public
# Output - For Loop with List
output "for_output_list" {
  description = "For Loop with List"
  value       = [for instance in aws_instance.web-instance : instance.public_dns]
}

locals {
   tmpl = <<-EOT
    %{for c in aws_instance.web-instance~}
    ${c.public_dns}
    %{endfor~}
  EOT
  # conns = join("\n", concat([for instance in aws_instance.web-instance : instance.public_dns]))
}

resource "local_file" "public-name" {
  content = local.tmpl
  filename = "output/public-dns.txt"
  
}
