class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.35"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.35/pikpaktui-aarch64-macos.tar.gz"
      sha256 "4a91a540ad9a026fc8c1502daadb4fd02405c70bb1463c00453b1d5b23702da8"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.35/pikpaktui-x86_64-macos.tar.gz"
      sha256 "7e067ed3459638e41db233702370904cbddc518c4b0bc0a49f6ba908d644c922"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.35/pikpaktui-x86_64-linux.tar.gz"
    sha256 "0a2c6a79fd0f1e23156abc1eb2a92fee220d252da50418788b2a85d295a4777b"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
