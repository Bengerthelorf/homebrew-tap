class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.26"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.26/pikpaktui-aarch64-macos.tar.gz"
      sha256 "a8ee38250b574a8145dc69a6ecd4a36b33143cfc412820d2355249a6e2119076"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.26/pikpaktui-x86_64-macos.tar.gz"
      sha256 "202707fe6f2077f5f13067d6649ad5738787cd9e491b67285292da20086b69aa"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.26/pikpaktui-x86_64-linux.tar.gz"
    sha256 "f5ba3652ac856d7aea9bd35667c6d13bd2f97247f4bda02f1bd7ffae766b1e33"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
