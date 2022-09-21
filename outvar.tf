output "public_instance_id" {
    value = aws_instance.instance_public.id
}
output "private_instance_id" {
    value = aws_instance.instance_private.id
}
output "NAT_instance_id" {
    value = aws_instance.instance_nat.id
}