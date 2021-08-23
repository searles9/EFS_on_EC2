# --- loadbalancing/main.tf

resource "aws_lb" "main_lb" {
  name            = "main-loadbalancer"
  security_groups = var.lb_sg
  subnets         = var.lb_subnets
}

# target group

# listener