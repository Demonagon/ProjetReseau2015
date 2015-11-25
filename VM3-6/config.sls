# Tuer Network Manager pour ne pas interférer dans la configuration réseau
NetworkManager:
  service:
    - dead
    - enable: False
    
# Supprimer la route par default 
ip route del default:
  cmd:
    - run

# Configuration  eth1
eth1:
  network.managed:
    - type: eth
    - enable_ipv6: True
    - ipv6proto: static
    - ipv6ipaddr: fc00:1234:4::36
    - ipv6netmask: 64

# Configuration  eth2
eth2:
  network.managed:
    - type: eth
    - enable_ipv6: True
    - ipv6proto: static
    - ipv6ipaddr: fc00:1234:2::36
    - ipv6netmask: 64









