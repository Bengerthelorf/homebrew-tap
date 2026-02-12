class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.7"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.7/pikpaktui-aarch64-macos.tar.gz"
      sha256 "f4e9eb1b28784ccf5bb30433aa6591abaf762a1e12883168460ef5b7006ebc68"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.7/pikpaktui-x86_64-macos.tar.gz"
      sha256 "8b3908299636d3d855dfca1dc51f4510128c9de13e069ecba198b23dd36efa68"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.7/pikpaktui-x86_64-linux.tar.gz"
    sha256 "bcf1d16b0a730608aeb3cc4941107fa78df3dee25bdccd1905588f7ade2ace89"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
