class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.34"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.34/pikpaktui-aarch64-macos.tar.gz"
      sha256 "2cb2498b54b87f0a6cb387709788639ee181661d79f8ebb0e90fe829bae38047"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.34/pikpaktui-x86_64-macos.tar.gz"
      sha256 "cf17e41afbd25d98aaad2f48e1230eae87a3e8487d94e242f168c42045144240"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.34/pikpaktui-x86_64-linux.tar.gz"
    sha256 "e95ffaecd8f12f14cfacbe6a8b7b029701c7f4a0bfa502982bd066bbca56bab2"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
