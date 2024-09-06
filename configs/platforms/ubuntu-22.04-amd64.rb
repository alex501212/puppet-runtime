platform "ubuntu-22.04-amd64" do |plat|
  plat.inherit_from_default

  plat.docker_run_args ['--tty', '--entrypoint=/bin/sh']
  plat.docker_image "amd64/ubuntu:22.04"
  plat.use_docker_exec true

  packages = %w(
    libbz2-dev
    libreadline-dev
    libselinux1-dev
    gcc
    swig
    systemtap-sdt-dev
    zlib1g-dev
  )
  plat.provision_with "export DEBIAN_FRONTEND=noninteractive && apt-get update -qq && apt-get install -qy --no-install-recommends #{packages.join(' ')}"
  plat.provision_with "curl https://artifactory.delivery.puppetlabs.net/artifactory/api/gpg/key/public | apt-key add -"
end
