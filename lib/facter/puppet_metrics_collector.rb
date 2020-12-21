Facter.add(:puppet_metrics_collector, type: :aggregate) do
  confine kernel: 'Linux'

  chunk(:vmware_tools) do
    if Facter::Core::Execution.which('vmware-toolbox-cmd')
      {have_vmware_tools: true}
    else
      {have_vmware_tools: false}
    end
  end

  chunk(:pe_psql) do
    if File.executable?('/opt/puppetlabs/server/bin/psql')
      {have_pe_psql: true}
    else
      {have_pe_psql: false}
    end
  end
end
