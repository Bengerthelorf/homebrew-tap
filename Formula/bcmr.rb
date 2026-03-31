class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.4.19"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.19/bcmr-aarch64-macos.tar.gz"
      sha256 "5104e445f99977ba96cf6ddfc3c1db261e10f411a6e3fe519b6be80b15baf156"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.19/bcmr-x86_64-macos.tar.gz"
      sha256 "3b0aa88f08961745ec889350f7f8123679a2535cab021464c4253f9df94092f0"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.19/bcmr-x86_64-linux.tar.gz"
    sha256 "42cda47844746dbd95012131510415e1233ae1374e68f0570480e8c4c50e5472"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
