class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.51"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.51/pikpaktui-aarch64-macos.tar.gz"
      sha256 "7fdee0a01b9ba462213f0fd5dc2b75ec1fa7bb789387d3c3e3cdced4f235ecc4"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.51/pikpaktui-x86_64-macos.tar.gz"
      sha256 "f1b734650afb3f418498c752e52bea0db7f3ca86aff1fbad8d3fc78c5f8cafba"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.51/pikpaktui-x86_64-linux.tar.gz"
    sha256 "4d343607e6b3e332be9fefb96d8e891d6dc30f7154a308c0a8ab3862d4f3ea6d"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
