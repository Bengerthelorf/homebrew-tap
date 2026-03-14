class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.52"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.52/pikpaktui-aarch64-macos.tar.gz"
      sha256 "3d84d65a81d34e18f4ad340a6edbb338cce6308e04f94c210778390171ae4638"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.52/pikpaktui-x86_64-macos.tar.gz"
      sha256 "b91a216d5a9125aeb05759063564aa60859d57979bc6bb7603f36d311079add5"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.52/pikpaktui-x86_64-linux.tar.gz"
    sha256 "aace61f6f0019345af0d5480aec6136e076df882f91c6a3c03851226bcb24a94"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
