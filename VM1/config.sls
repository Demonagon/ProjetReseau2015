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
    - enabled: True
    - type: eth
    - proto: static
    - ipaddr: 172.16.2.131
    - netmask: 28
    - gateway: 172.16.2.132

# Configuration  eth2
eth2:
  network.managed:
    - type: eth
    - enable_ipv6: True
    - ipv6proto: static
    - ipv6ipaddr: fc00:1234:3::1
    - ipv6netmask: 64




