require_relative 'spec_helper'

describe 'openstack-bare-metal::ironic-common' do
  describe 'redhat' do
    let(:runner) { ChefSpec::SoloRunner.new(REDHAT_OPTS) }
    let(:node) { runner.node }
    cached(:chef_run) { runner.converge(described_recipe) }

    include_context 'bare-metal-stubs'

    it do
      expect(chef_run).to upgrade_package %w(openstack-ironic-common python-ironicclient)
    end
  end
end
