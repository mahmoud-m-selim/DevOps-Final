module "network" {
  source              = "./network"
  project             = var.project
  region              = var.region
  private_subnet_cidr = var.private_subnet_cidr
  public_subnet_cidr  = var.public_subnet_cidr
}

module "gke" {
  source                          = "./gke"
  project                         = var.project
  region                          = var.region
  vpc_name                        = module.network.vpc_name
  subnet_name                     = module.network.private_subnet_name
  pods_cidr                       = var.pods_cidr
  services_cidr                   = var.services_cidr
  master_cidr                     = var.master_cidr
  master_authorized_networks_cidr = var.public_subnet_cidr

  depends_on = [module.network]
}