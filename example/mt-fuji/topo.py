from mininet.topo import Topo

class SpineLeaf(Topo):
  def build(self):
    s_num = 2
    l_num = 5
    h_num = 2
    spines = []
    leaves = []
    hosts = []

    for i in range(s_num):
      spines.append(self.addSwitch('s%s%s' % (1, i+1)))
    for i in range(l_num):
      leaves.append(self.addSwitch('l%s%s' % (2, i+1)))
      for j in range(s_num):
        self.addLink(spines[j], leaves[i])
      for j in range(h_num):
        hosts.append(self.addHost('h%s%s' % (i+1, j+1)))
        self.addLink(leaves[i], hosts[i * h_num + j])

topos = { 'spineleaf': (lambda: SpineLeaf()) }