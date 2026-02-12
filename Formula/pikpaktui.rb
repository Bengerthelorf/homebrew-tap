class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.9"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.9/pikpaktui-aarch64-macos.tar.gz"
      sha256 "8b17426688b8938b441a7a52c432e7f0ca4e56944a556877e9adea86cd35af5a"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.9/pikpaktui-x86_64-macos.tar.gz"
      sha256 "9aa7258846223b8e63621e8a648c58c7a4c3c871433d76b0aa440ec026002e6f"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.9/pikpaktui-x86_64-linux.tar.gz"
    sha256 "5cb4edf66a9bb5bc7cf6e681d697979855b87863008882f0c2af287021eb87f6"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
