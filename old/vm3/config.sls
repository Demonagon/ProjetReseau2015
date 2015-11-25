# Configuration eth1
# RAPPEL: eth0 est à vagrant, ne pas y toucher

## Désactivation de network-manager
NetworkManager:
  service:
    - dead
    - enable: False
    

##Configuration de VM3
eth1:
  network.managed:
    - enabled: True
    - type: eth
    - proto: none
    - ipaddr: 172.16.2.163
    - netmask: 255.255.255.240
    - gateway: 172.16.2.132

eth2:            
  network.managed:                                                              
   # - enabled: True           
    # - type: eth                                                        
    #-  proto: none                                                   
    # - ipaddr: 192.168.2.3     # nécessaire mais bidon                        
    # - netmask: 255.255.255.0               
    - enable_ipv6: True                          
    - ipv6proto: static                       
    - ipv6ipaddr: fc00:1234:4::3      
    - ipv6netmask: 64
    - ipv6gateway: fc00:1234:4::36

## Suppression de la passerelle par défaut
ip route del default:
  cmd:
    - run


