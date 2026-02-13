class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.16"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.16/pikpaktui-aarch64-macos.tar.gz"
      sha256 "5e9181f6501de082351c21c6b190a339271abbd5389563058a03a235249fe775"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.16/pikpaktui-x86_64-macos.tar.gz"
      sha256 "c0d5fd824f0b42764ebea7cca292936f40d3d0cf7e3a3ec0d3bc9a3a53944c9f"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.16/pikpaktui-x86_64-linux.tar.gz"
    sha256 "e9eb15a66c23856cb655fda22ec26e158bde53a3da972866f2f92f40ec79c2b9"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
