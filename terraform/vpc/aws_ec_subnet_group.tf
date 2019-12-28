resource "aws_elasticache_subnet_group" "redis" {
  name = "redis"
  subnet_ids = [aws_subnet.private_subnet_3.id, aws_subnet.private_subnet_4.id]
}