# inpsec tests for default suite

jenkins_home = "/var/lib/jenkins"

describe service('jenkins') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe port('8080') do
  it { should be_listening }
end

{
  "#{jenkins_home}": '0755',
  "#{jenkins_home}/init.groovy.d": '0755',
  "/var/log/jenkins": '0750'
}.each do |d, m|
  describe file(d) do
    it { should be_directory }
    it { should be_owned_by('jenkins') }
    it { should be_grouped_into('jenkins') }
    its('mode') { should cmp m }
  end
end
