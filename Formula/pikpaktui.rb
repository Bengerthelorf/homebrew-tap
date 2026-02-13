class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.17"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.17/pikpaktui-aarch64-macos.tar.gz"
      sha256 "5a5cfa22e28418f3c1ac1bd78477a3d1cd6a4369c8f73c7f15cc9e4dfb92986f"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.17/pikpaktui-x86_64-macos.tar.gz"
      sha256 "21e7ea6cbb2e2358f22b52335aad45c48e2d4e7d9071eff0c3a88de2f9594aac"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.17/pikpaktui-x86_64-linux.tar.gz"
    sha256 "3063f0ddd5dd294d328fbd9566c29820a37dae367e62ecc4278dd81e1b133792"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
