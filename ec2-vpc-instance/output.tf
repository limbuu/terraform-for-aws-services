output "vpc_id" {
  description = "This is the Id of VPC attached to EC2 instance"
  value = aws_vpc.vpc.id
}
output "public_subnets" {
  description = "This is the Id of public subnet attached to EC2 instance"
  value = aws_subnet.subnet_public.id
}
output "public_route_table_ids" {
  description = "These are the Ids of public route_table"
  value = aws_route_table.rtb_public.id
}
output "public_instance_ip" {
  description = "These are the public Ip of EC2 instance"
  value = aws_instance.testInstance.public_ip
}