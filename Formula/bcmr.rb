class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.5.13"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.13/bcmr-aarch64-macos.tar.gz"
      sha256 "b7df09005156c9083cc0077231230cd6f55c2b2d2232cb2aebbcf760c0aef65a"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.13/bcmr-x86_64-macos.tar.gz"
      sha256 "37758bfebfda1b4c484a805595f61c1b117b7b3840c07f0022a5984397528691"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.13/bcmr-x86_64-linux.tar.gz"
    sha256 "5c2500857e0aedb2a778f74d8150bd7ec30d3acb384f344981cbf6887a95535d"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
