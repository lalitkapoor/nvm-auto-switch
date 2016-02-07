require 'formula'

class NvmAutoSwitch < Formula
  homepage 'https://github.com/lalitkapoor/nvm-auto-switch#readme'
  url 'https://github.com/lalitkapoor/nvm-auto-switch/archive/v0.1.1.tar.gz'
  sha256 '607745f92f3e1813305e6e8edef785d59540c7a398abe7bdfdbda5cae6d9dd38'
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
