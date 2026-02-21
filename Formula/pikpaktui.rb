class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.39"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.39/pikpaktui-aarch64-macos.tar.gz"
      sha256 "36524b33f91383d59cbcd911a412d0c9cf425feb6fe377a8fbcae3529a7723b9"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.39/pikpaktui-x86_64-macos.tar.gz"
      sha256 "0e68035f1b890941118a7a11cd2447fa9f1e78bf1f12ce1d9f6d3fab7a55d1c0"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.39/pikpaktui-x86_64-linux.tar.gz"
    sha256 "058276ea9e262eef2d436060005bd4d0c545a00a01398ba2c680be82da506eeb"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
