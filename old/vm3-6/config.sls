# en statique
eth1:
  network.managed:
#    - enabled: True           
    - type: eth                                                        
#    - proto: none                                                   
#    - ipaddr: 192.168.2.3     # nécessaire mais bidon                        
#    - netmask: 255.255.255.0               
    - enable_ipv6: True                          
    - ipv6proto: static                       
    - ipv6ipaddr: fc00:1234:2::36     
    - ipv6netmask: 64
#    - ipv6gateway: fc00:1234:2::3
# en automatique

# en statique
#eth2:
#  network.managed:
#    - enabled: True           
#    - type: eth                                                        
#    - proto: none                                                   
#    - ipaddr: 192.168.2.3     # nécessaire mais bidon                        
#    - netmask: 255.255.255.0               
#    - enable_ipv6: True                          
#    - ipv6proto: static                       
#    - ipv6ipaddr: fc00:1234:4::36      
#    - ipv6netmask: 64
#    - ipv6gateway: fc00:1234:4::26

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
