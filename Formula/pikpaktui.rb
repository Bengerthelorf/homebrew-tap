class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.58"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.58/pikpaktui-aarch64-macos.tar.gz"
      sha256 "3641984b4b44ff7ec963d91a4467fe17ea0399263432f402bc60ea7c59ecc1a9"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.58/pikpaktui-x86_64-macos.tar.gz"
      sha256 "3710bad1ba74f28b4f905f3a0d563f55e2be9ba150c2c89e7d443703c59e787f"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.58/pikpaktui-aarch64-linux.tar.gz"
      sha256 "098325d4dc15125c31387a65b45c6656714561a88533f826b14f4ac37524f7a7"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.58/pikpaktui-x86_64-linux.tar.gz"
      sha256 "fa5f60fedb863684d26891ebc3acd8a0a4a282e354d60ecf315d878b27d72326"
    end
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
