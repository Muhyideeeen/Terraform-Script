data "aws_ami" "selected" {
  most_recent = true
  filter {
    name   = "name"
    values = [var.ami_filters.name]
  }
  owners = [var.ami_filters.owner_id]
}

resource "aws_launch_template" "this" {
  name_prefix   = "${var.name}-lt-"
  image_id      = data.aws_ami.selected.id
  instance_type = var.instance_type
  user_data     = var.user_data != "" ? base64encode(var.user_data) : null

  vpc_security_group_ids = var.security_group_ids

  tag_specifications {
    resource_type = "instance"
    tags = merge({ Name = var.name }, var.tags)
  }
}

resource "aws_autoscaling_group" "this" {
  name = "${var.name}-asg"

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  vpc_zone_identifier = var.private_subnet_ids
  desired_capacity    = var.asg_desired
  min_size            = max([1, var.asg_desired])
  max_size            = var.asg_desired + 1

  tag {
    key                 = "Name"
    value               = var.name
    propagate_at_launch = true
  }
}
