class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.56"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.56/pikpaktui-aarch64-macos.tar.gz"
      sha256 "6e46bf3b7f329b01d6de938714eecf40d504b05ef223bca218d51f2ed518ee16"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.56/pikpaktui-x86_64-macos.tar.gz"
      sha256 "957e8d6913ffe99bdbb82c6c3b11ae8a5eeb80b28d4dbb3b5ea334213e88f45e"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.56/pikpaktui-x86_64-linux.tar.gz"
    sha256 "403e0c65bcf7f83cf65d6703f061446b49089b347dbb27b320912b2e4f899f23"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
