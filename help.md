# SSH Tunneling

http://www.linux-france.org/prj/edu/archinet/systeme/ch13s04.html

# Linux Bridge

Install bridge-utils

- Add bridge: brctl addbr <bridge>
- Add port on bridge: brctl addbr <bridge>
- Set bridge up: ifconfig <bridge> up

# Route

- List route: route
- Add route: ip route add 192.168.1.0/24 dev eth0 OR ip route add 192.168.1.0/24 via 192.168.1.254
- Delete route: ip route del 192.168.1.0/24 dev eth0
- Find route for ip: ip route get 192.168.0.1

# Arp

- Show arp table: arp
- Clear arp entry: arp -d <ip>

# OpenVSwitch

- Show ports: ovs-vsctl show
- Add port: ovs-vsctl add-port <bridge> <interface, for instance eth1>
- Show OpenFlow rules: ovs-ofctl dump-flows <bridge>

# Network Debug

- Listen for a specific Vlan: tcpdump -i <interface> vlan <vlan number> (sometimes not working)
- Listen on an interface: tcpdump -leni eth4
- Show opened connexion: netstat -ntlp
- Verifier que les interfaces physiques fonctionnent:
  Créer une interface de test avec openvswitch.
  On va créer un bridge car en arrière plan, cela créer une interface: sudo ovs-vsctl add-br br-vlan288 br-nsb 288
  On relie directement le nouveau bridge au br-nsb ou run que l'on test et on lui passe le vlan à tester. Toutes les trames non taguées qui vont passer par ce bridge vont recevoir le tag 288.
  Associer une adresse ip à la nouvelle interface créé: sudo ifconfig br-vlan288 1.1.1.2/24 up
  Associer une adresse ip différente sur l'autre noeud
  et ensuite on peut pingué : ping 1.1.1.2 

# Log
- Search in all logs: zgrep -i error /var/log/neutron/l3-agent.log*

# Package
- Find if a package is installed : dpkg -l | grep <package_name>
- Find all files installed by a package: dpkg -L <package_name> 
- Find which process lock dpkg: lsof | grep dpkg (or apt)

# Search
- Find word in folder: grep -Hrn 'word' /folder
