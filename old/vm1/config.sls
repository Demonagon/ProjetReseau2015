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
    - enable_ipv6: True                          
    - ipv6proto: static                       
    - ipv6ipaddr: fc00:1234:3::1 
    - ipv6netmask: 64
    - ipv6gateway: fc00:1234:3::16 
#    - gateway: 172.16.2.132


## Configuration des routes manuellement
routes:
  network.routes:
    - name: eth1
    - routes:
      - name: lan1
        ipaddr: 172.16.2.131
        netmask: 255.255.255.240
        gateway: 172.16.2.132


## Suppression de la passerelle par défaut
ip route del default:
  cmd:
    - run


