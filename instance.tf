resource "aws_key_pair" "mohsen-key" {
  key_name   = "mohsen-key"
  public_key = file(var.public_key)
}

resource "aws_instance" "terraform-test" {
  ami                    = var.amis[var.region]
  instance_type          = "t2.micro"
  availability_zone      = var.zone1
  subnet_id              = aws_subnet.mohsen-pub-1.id
  key_name               = aws_key_pair.mohsen-key.key_name
  vpc_security_group_ids = [aws_security_group.mohsen_stack_sg.id]
  tags = {
    name    = "mohsen-instance"
    project = "vprofile"
  }
  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"

  }

  provisioner "remote-exec" {
    inline = [
      "chmod u+s /tmp/web.sh",
      "sudo  sh /tmp/web.sh"
    ]

  }

  connection {
    user        = var.user
    private_key = file("mohsenkey")
    host        = self.public_ip
  }

}

resource "aws_ebs_volume" "vol-mohsen" {
  availability_zone = var.zone1
  size              = 3

}

resource "aws_volume_attachment" "vol_attach_mohsen" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.vol-mohsen.id
  instance_id = aws_instance.terraform-test.id

}

output "public_ip" {
  value = aws_instance.terraform-test.public_ip

}