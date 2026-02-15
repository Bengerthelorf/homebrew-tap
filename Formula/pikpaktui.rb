class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.27"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.27/pikpaktui-aarch64-macos.tar.gz"
      sha256 "967f3d971f15146d134b1c6fad0490cd1b03b1012b74f5e516290cf6463c0191"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.27/pikpaktui-x86_64-macos.tar.gz"
      sha256 "45f94d73981fa498534b079400d59347db17852737a9d801b370afdf9c1ab911"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.27/pikpaktui-x86_64-linux.tar.gz"
    sha256 "8646e6a37575e7322e1bcc711515b31fab77247b64d187bdf2d0543c9342e837"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
