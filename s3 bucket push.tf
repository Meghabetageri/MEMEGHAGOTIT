resource "aws_s3_bucket" "bucket-1234" {
  bucket = "bucket-1234-unique"  # Ensure this name is globally unique
  acl    = "private"  # Set to private to restrict public access
}

# Create an EC2 instance
resource "aws_instance" "Ramram-instance" {
  ami           = "ami-00bb6a80f01f03502"  # Amazon Linux 2 AMI (Change if needed)
  instance_type = "t2.micro"  # You can choose any type that fits your needs
  key_name      = "megha1"  # Ensure you have an existing SSH key pair

  # Optional: associate with security group that allows SSH access
  security_groups = ["to-my-sg"]

  # Optional: Add tags for the EC2 instance
  tags = {
    Name = "Ramram-instance"
  }
}

# Optional: Define a security group that allows SSH access (port 22)
resource "aws_security_group" "to-my-sg" {
  name        = "to-my-sg"
  description = "Allow SSH access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from any IP address (be cautious with this in production)
  }
}
 
