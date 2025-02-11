region                = "us-east-1"
environment           = "dev"
state_bucket          = "trip-radar-terraform-state"
nlb_endpoint          = "http://my-nlb-dev-1234567890.elb.amazonaws.com"
cognito_user_pool_name = "my-dev-user-pool"
subnet_ids            = ["subnet-0123456789abcdef0", "subnet-0fedcba9876543210"]
security_group_ids    = ["sg-0123456789abcdef0"]
