class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.28"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.28/pikpaktui-aarch64-macos.tar.gz"
      sha256 "eecb74a892ae7b6f647dcd89a572ef8f0cfe3ad795a790835ebfe77ee2816220"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.28/pikpaktui-x86_64-macos.tar.gz"
      sha256 "a1056abd7000b40f64d504ddd3cde599b261ffc0e9416c63b57400f003565ddb"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.28/pikpaktui-x86_64-linux.tar.gz"
    sha256 "be04b4a91e8c26ebb098685b75b3df426c256b57e7b82eb06aa73a6c5805a606"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
