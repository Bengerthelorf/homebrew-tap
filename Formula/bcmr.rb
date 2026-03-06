class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.4.1"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.1/bcmr-aarch64-macos.tar.gz"
      sha256 "371d2d4f8476229cf40a1538f2917ff8a6ef4e49ee18391d4846664b9717ca35"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.1/bcmr-x86_64-macos.tar.gz"
      sha256 "fc568e4f309b9b766ef9566e4221b4ea3846a300c7b2964f10fbd4da19a5f078"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.1/bcmr-x86_64-linux.tar.gz"
    sha256 "c6da8c9df361da2ea65cf2eb24c7f21dfedd256f8f93352b5799461f945cb8dd"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
