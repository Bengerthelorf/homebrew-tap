class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.2"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.2/pikpaktui-aarch64-macos.tar.gz"
      sha256 "f29d433602a70aa7503e72e4c614acf9d3a39ec03c66dbcc6741def47ebc6a9e"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.2/pikpaktui-x86_64-macos.tar.gz"
      sha256 "83767592bc4c51bff3b3f262aeb56d9b9f2c285a794052c77bfb95590641618f"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.2/pikpaktui-x86_64-linux.tar.gz"
    sha256 "028321d2c1cd5c02830655a81c103ad1086cba8d1124c210b3ed3f85327ea91b"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
