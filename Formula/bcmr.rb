class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.5.4"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.4/bcmr-aarch64-macos.tar.gz"
      sha256 "6c1dc1a563c0cd28134f1b34bd858c980f3418b5747035642719f1592b274262"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.4/bcmr-x86_64-macos.tar.gz"
      sha256 "c38f85a41d1b0cac1e3c484b2ff897c0eed0724a0e8c30dfa391ebcef7eb4ae4"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.4/bcmr-x86_64-linux.tar.gz"
    sha256 "55274b206863be53939028db2a27b1f81151c521ff335dc9b6ac7450212d6291"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
