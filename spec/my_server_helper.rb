
def default_platforms
  platforms = {
  'redhat' => {
    'versions' => ['5.10', '6.6', '7.1']
    }
  }
  platforms
end

def create_default_environment(server)
  server.create_environment('my_environment', { description: 'test' })
  server.create_role('app_satellite_server', { default_attributes: {} })
end

def create_default_nodes(node)
  node.set['rhn']['hostname'] = 'something'
  node.set['rhn']['activation_keys'] = 'blah'
  node.set['rhn']['actions']['enabled'] = ['all']
  node.set['rhn']['org_ca_cert']['action'] = 'install'
  node.set['rhn']['org_ca_cert']['name'] = 'RHN-ORG-TRUSTED-SSL-CERT'
  node.run_list.add('role[app_satellite_server]')
end

def create_default_databag(server)
  server.create_data_bag('packages', {
    'apache2' => {
      'name' => 'apache2'
    }
  })
end
