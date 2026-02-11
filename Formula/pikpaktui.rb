class Pikpaktui < Formula
  desc "A TUI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.1"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.1/pikpaktui-aarch64-macos.tar.gz"
      sha256 "f38751d3db1a261420a0d3db6c952538deea7105b958b59b21a34d59079c1a4a"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.1/pikpaktui-x86_64-macos.tar.gz"
      sha256 "f4404a1057f09adcbb5b890b6b2b4ac779c8a8d2a731e61438849901166b04c7"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.1/pikpaktui-x86_64-linux.tar.gz"
    sha256 "eb3e40e865f90ec3b50998de87a14df3875d05fee24c7323ed558f25b80051a6"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
