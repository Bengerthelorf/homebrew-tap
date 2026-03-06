class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.47"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.47/pikpaktui-aarch64-macos.tar.gz"
      sha256 "10f451b5b256e146997ee5548212fdf8516901f3af335f2a5484bccde468f4f0"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.47/pikpaktui-x86_64-macos.tar.gz"
      sha256 "95bd7660f61b1819fa37d6f5399b7907299a1f4d5c0567ac95fad0fe78a296cb"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.47/pikpaktui-x86_64-linux.tar.gz"
    sha256 "ad96d322796b572e83ff7f4dd13e36422f4cb03cb2e1651b6038c4260e6f21cc"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
