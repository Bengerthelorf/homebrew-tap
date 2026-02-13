class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.18"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.18/pikpaktui-aarch64-macos.tar.gz"
      sha256 "e60100e66d11ba158ccf7a2d23e9310a4afde47a0a0425147e92dcd60752ea22"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.18/pikpaktui-x86_64-macos.tar.gz"
      sha256 "43bb9a9dfabb878d0d3ef3b1ec14905be987691ce8b8ac11906c14e61e5facf7"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.18/pikpaktui-x86_64-linux.tar.gz"
    sha256 "486da2ac4e95de9862a520c0956cb4d5c826c6beff62b36312cb0c569c9638c8"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
