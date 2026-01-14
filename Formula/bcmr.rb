class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.3.25"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.25/bcmr-aarch64-macos.tar.gz"
      sha256 "dd6b7d9afe3e53282b274ddfbeb41356c0b90a578f5af1096f6aaa35423613c2"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.25/bcmr-x86_64-macos.tar.gz"
      sha256 "4be913c7bd24a80c784f91eb756484f102298673514cee302a899864303f3f75"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.25/bcmr-x86_64-linux.tar.gz"
    sha256 "d56b86ea66f21100410e27eea11e4ff038288237dfd9c84bce5b7e30b4e4006e"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
