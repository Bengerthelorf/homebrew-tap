class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.40"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.40/pikpaktui-aarch64-macos.tar.gz"
      sha256 "b3fb6af9ee17ec678dd4d097161997d6666f29294dfb36bc8327bfeb1f6c8d59"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.40/pikpaktui-x86_64-macos.tar.gz"
      sha256 "be4d4508b67a4e0ecd6f674d2139960c6cca16bb60bcbcf6507c413bf025fb73"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.40/pikpaktui-x86_64-linux.tar.gz"
    sha256 "58c391c5722a59076487c1ce8b7735b7adc2e7057925a6c8e76a041cdf3d15af"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
