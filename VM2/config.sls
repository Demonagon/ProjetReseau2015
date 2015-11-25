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
    - ipaddr: 172.16.2.132
    - netmask: 28
    - enable_ipv6: False

# Configuration  eth2
eth2:
  network.managed:
    - enabled: True
    - type: eth
    - proto: static
    - ipaddr: 172.16.2.162
    - netmask: 28
    - enable_ipv6: False

# Activation drapeau de routage ipv4 
net.ipv4.conf.all.forwarding:
  sysctl:
    - present
    - value: 1









