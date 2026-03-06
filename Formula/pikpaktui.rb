class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.49"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.49/pikpaktui-aarch64-macos.tar.gz"
      sha256 "ff14f4d6bc043b78ae0af5c1a2f7fcafa347af78cee367c64c2ec1516866caa7"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.49/pikpaktui-x86_64-macos.tar.gz"
      sha256 "28a4a509a202ea7bbaa55e974a86259ed1d1b92b61f92338d7025b8f72f184cf"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.49/pikpaktui-x86_64-linux.tar.gz"
    sha256 "98a9222b48475470ec4c4eb3e665f1268a0556a10adcd4bdba552507e1de7e6d"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
