# en statique
eth1:          
  network.managed:
    - enabled: True           
    - type: eth                                                        
    - proto: none                                                   
    - ipaddr: 192.168.2.3     # nécessaire mais bidon                        
    - netmask: 255.255.255.0               
    - enable_ipv6: True                          
    - ipv6proto: static                       
    - ipv6ipaddr: fc00:1234:1::26     
    - ipv6netmask: 64

# en automatique

# en statique
eth2:            
  network.managed:
    - enabled: True           
    - type: eth                                                        
    - proto: none                                                   
    - ipaddr: 192.168.2.3     # nécessaire mais bidon                        
    - netmask: 255.255.255.0               
    - enable_ipv6: True                          
    - ipv6proto: static                       
    - ipv6ipaddr: fc00:1234:2::26     
    - ipv6netmask: 64


#eth2:            
  #network.managed:                                                              
 #   - enabled: True           
  #  - type: eth                                                        
   # - proto: none                                                   
    #- ipaddr: 192.168.2.4     # nécessaire mais bidon                        
   # - netmask: 255.255.255.0               
   # - enable_ipv6: True                          
    #- ipv6proto: static                     
    #- ipv6ipaddr: fc00:1234:2::2      
   # - ipv6netmask: 64
