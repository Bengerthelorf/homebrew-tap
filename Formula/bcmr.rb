class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.6.0"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.6.0/bcmr-aarch64-macos.tar.gz"
      sha256 "23b4ae3383be764999b45f4e2e32d147c68e04f47b3edc9dcaecb919166f08b2"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.6.0/bcmr-x86_64-macos.tar.gz"
      sha256 "0fb680040b3026fa21551e5f3b1e272b2887baf8a76ac107eb1268f66c561bef"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.6.0/bcmr-x86_64-linux.tar.gz"
    sha256 "2d41cfef26fc44156dddf042f850650af54c6aa07e0a42e86a005e33294e5555"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
