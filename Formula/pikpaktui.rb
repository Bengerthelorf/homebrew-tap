class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.21"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.21/pikpaktui-aarch64-macos.tar.gz"
      sha256 "624ebd9a29386d4f3b46b0120e6d680e70c56e374a21e809bb5f16c7a47667b2"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.21/pikpaktui-x86_64-macos.tar.gz"
      sha256 "2c7d64175586d4181a530f78e997547567f20e4878310e3c12d896a04fc31c23"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.21/pikpaktui-x86_64-linux.tar.gz"
    sha256 "f3d2761694abc5c4966fc68ef08171d04ecdc7a94679811c40386fe07a201be9"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
