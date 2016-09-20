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
- Voir les sockets ouverts: ss -l

# Log
- Search in all logs: zgrep -i error /var/log/neutron/l3-agent.log*

# Package
- Find if a package is installed : dpkg -l | grep <package_name>
- Find all files installed by a package: dpkg -L <package_name> 
- Find which process lock dpkg: lsof | grep dpkg (or apt)

# Search
- Find word in folder: grep -Hrn 'word' /folder

# Curl

- curl -H "Accept: application/json" -H "Content-Type: application/json" -H "X-Auth-Token: 87008f67b6724aa5a78be0218f0754ec" -X GET http://localhost:8999/v1/serverbackups | json_pp
- -H=Header
- -X=Get or Post
- json_pp = pretty print json


# OpenStack

## Publier
Les commandes sont lancees en admin pour eviter les problemes
- Creation du reseau: openstack  network create my --provider-network-type vlan --provider-physical-network run --provider-segment 787
- Creation du subnet: openstack subnet create --subnet-range 160.0/24 --network 31278fc3-078c-49d9-9af7-fad93d6d0c47 my
- Creation de la vm: openstack server create --image cirros --flavor 1 --nic net-id=31278fc3-078c-49d9-9af7-fad93d6d0c47 my
- Creation du routeur: openstack router create my
- Ajout du subnet au routeur: openstack router add subnet e6225dd5-56bc-4216-8201-d92b664908ec 28b7e4c5-a691-45e5-8212-cb14aa4deb64
- Ajout de la gateway sur le routeur: router-gateway-set e6225dd5-56bc-4216-8201-d92b664908ec c2a192f1-cb05-4e6a-8d99-fb3e523ce2f8 (la commande n'est pas encore dans openstack)
- Recuperer l'ip de la vm: openstack server list
- Recuperer le port associe: openstack port list | grep 160.0.0.3
- Ajouter une floating ip sur le port vers le reseau de pub: openstack floating ip create net-pub --port 5c0d6614-be1e-4bb6-8fb7-1c0095525f4b
