# Configuration eth1
# RAPPEL: eth0 est à vagrant, ne pas y toucher

## Désactivation de network-manager
NetworkManager:
  service:
    - dead
    - enable: False
    

##Configuration de VM1
eth1:
  network.managed:
    - enabled: True
    - type: eth
    - proto: none
    - ipaddr: 172.16.2.131
    - netmask: 255.255.255.240
#    - gateway: 172.16.2.132


## Configuration des routes manuellement
routes:
  network.routes:
    - name: eth1
    - routes:
      - name: lan1
        ipaddr: 172.16.2.163
        netmask: 255.255.255.240
        gateway: 172.16.2.132


## Suppression de la passerelle par défaut
ip route del default:
  cmd:
    - run


