class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.4.14"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.14/bcmr-aarch64-macos.tar.gz"
      sha256 "2ea410e5f6a8845dc1d8d20abe685f2934cba1887edb43ca1f4a65c03a338888"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.14/bcmr-x86_64-macos.tar.gz"
      sha256 "1139f0d889f7aaf9138e154e4223c4036096566fac3c887a228f5d9306243591"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.14/bcmr-x86_64-linux.tar.gz"
    sha256 "375f95e2f7d657e1646ca067d5a73af30b3aef3621563623e1a4d34f8a906985"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
