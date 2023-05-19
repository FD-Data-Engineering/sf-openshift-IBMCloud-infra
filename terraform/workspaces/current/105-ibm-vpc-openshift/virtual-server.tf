data "ibm_is_image" "ibm_centos" {
  name = "ibm-centos-stream-9-amd64-1"
}

data "ibm_is_ssh_key" "ssh_key_id" {
  name = var.vm1_ssh_key
}

resource "ibm_is_security_group" "dev_sf_sg1" {
  name           = "dev-sf-elk-sg1"
  vpc            = module.ibm-vpc.id
  resource_group = module.resource_group.id
}

resource "ibm_is_security_group_rule" "ingress_ssh_all" {
  group     = ibm_is_security_group.dev_sf_sg1.id
  direction = "inbound"
  remote    = "0.0.0.0/0"

  tcp {
    port_min = 22
    port_max = 22
  }
}

resource "ibm_is_security_group_rule" "ingress_http_all" {
  group     = ibm_is_security_group.dev_sf_sg1.id
  direction = "inbound"
  remote    = "0.0.0.0/0"

  tcp {
    port_min = 80
    port_max = 80
  }
}

resource "ibm_is_security_group_rule" "ingress_logstash_all" {
  group     = ibm_is_security_group.dev_sf_sg1.id
  direction = "inbound"
  remote    = "0.0.0.0/0"

  tcp {
    port_min = 9600
    port_max = 9600
  }
}

resource "ibm_is_security_group_rule" "ingress_kibana_all" {
  group     = ibm_is_security_group.dev_sf_sg1.id
  direction = "inbound"
  remote    = "0.0.0.0/0"

  tcp {
    port_min = 5601
    port_max = 5601
  }
}

resource "ibm_is_security_group_rule" "ingress_elasticsearch_all" {
  group     = ibm_is_security_group.dev_sf_sg1.id
  direction = "inbound"
  remote    = "0.0.0.0/0"

  tcp {
    port_min = 9200
    port_max = 9200
  }
}

resource "ibm_is_security_group_rule" "icmp" {
  group     = ibm_is_security_group.dev_sf_sg1.id
  direction = "inbound"
  remote    = "0.0.0.0/0"
  icmp {
    code = 0
    type = 8
  }
}

resource "ibm_is_security_group_rule" "egress_udp_1" {
  group     = ibm_is_security_group.dev_sf_sg1.id
  direction = "outbound"
  remote    = "161.26.0.8"
  udp {
    port_min = 53
    port_max = 53
  }
}

resource "ibm_is_security_group_rule" "egress_udp_2" {
  group     = ibm_is_security_group.dev_sf_sg1.id
  direction = "outbound"
  remote    = "161.26.0.7"
  udp {
    port_min = 53
    port_max = 53
  }
}

resource "ibm_is_security_group_rule" "egress_udp_3" {
  group     = ibm_is_security_group.dev_sf_sg1.id
  direction = "outbound"
  remote    = "161.26.0.11"
  udp {
    port_min = 53
    port_max = 53
  }
}

resource "ibm_is_security_group_rule" "egress_udp_4" {
  group     = ibm_is_security_group.dev_sf_sg1.id
  direction = "outbound"
  remote    = "161.26.0.10"
  udp {
    port_min = 53
    port_max = 53
  }
}

resource "ibm_is_security_group_rule" "egress_all" {
  group     = ibm_is_security_group.dev_sf_sg1.id
  direction = "outbound"
  remote    = "0.0.0.0/0"

}

resource "ibm_is_instance" "dev_sf_elk" {
  name           = "dev-sf-elk-vm1"
  image          = data.ibm_is_image.ibm_centos.id
  resource_group = module.resource_group.id
  profile        = "cx2-8x16"
  vpc            = module.ibm-vpc.id
  zone           = "eu-de-1"
  keys           = [data.ibm_is_ssh_key.ssh_key_id.id]

  primary_network_interface {
    subnet          = module.cluster_subnets.subnets[0].id
    security_groups = [ibm_is_security_group.dev_sf_sg1.id]
  }


  timeouts {
    create = "15m"
    update = "15m"
    delete = "15m"
  }
}

resource "ibm_is_floating_ip" "fip1" {
  name   = "dev-sf-elk-fip1"
  target = ibm_is_instance.dev_sf_elk.primary_network_interface[0].id
}
