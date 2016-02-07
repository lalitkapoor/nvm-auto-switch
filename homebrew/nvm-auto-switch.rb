require 'formula'

class NvmAutoSwitch < Formula
  homepage 'https://github.com/lalitkapoor/nvm-auto-switch#readme'
  url 'https://github.com/lalitkapoor/nvm-auto-switch/archive/v0.1.2.tar.gz'
  sha256 '6887acbca404477ebb95e89f66e4447045b3f4ccfd4f6c48f7c89e96036363d3'
  head "https://github.com/lalitkapoor/nvm-auto-switch.git"

  bottle :unneeded

  def install
    prefix.install "nvm-auto-switch.sh"
  end

  def caveats; <<-EOS.undent
    This will enable auto-switching of node versions specified by .nvmrc files.
    It will walk up the tree till it finds a .nvmrc file else it will use the
    version specified by the default alias in nvm.

    *******************************************************************************
    To use this you will need to add the following to the #{shell_profile} or your
    desired shell after loading nvm:
      source #{opt_prefix}/nvm-auto-switch.sh
    *******************************************************************************
    EOS
  end
end
