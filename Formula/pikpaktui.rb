class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.30"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.30/pikpaktui-aarch64-macos.tar.gz"
      sha256 "ed57d1df8a2e43bc0c2c42c7333efdc90345e53f7df1be55458cafc08a4bd255"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.30/pikpaktui-x86_64-macos.tar.gz"
      sha256 "b5168615c772131456e70c805a291fd57d09b218644cf3247d9650c3c1b7dacb"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.30/pikpaktui-x86_64-linux.tar.gz"
    sha256 "ec247f29c10ad679b4c586c0d3d041f68645f410ac13020a51c93c7e94ccf9f3"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
