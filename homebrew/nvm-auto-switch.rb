require 'formula'

class NvmAutoSwitch < Formula
  homepage 'https://github.com/lalitkapoor/nvm-auto-switch#readme'
  url 'https://github.com/lalitkapoor/nvm-auto-switch/archive/v0.1.0.tar.gz'
  sha256 '7e880d409ec163f738088779149206477bf44f4829bea2a64cdb22aba0578a1c'
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
