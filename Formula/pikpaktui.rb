class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.19"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.19/pikpaktui-aarch64-macos.tar.gz"
      sha256 "c98f4d83b3b3eee6e6e9a2625ab6ecc79968214ef4f62decbdddafbc5008bbc3"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.19/pikpaktui-x86_64-macos.tar.gz"
      sha256 "c94c70ba1f7ac411ce659ff02d2aedcfd5e0e3486f6585edb5c9091aeb734063"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.19/pikpaktui-x86_64-linux.tar.gz"
    sha256 "b916fe65f61e53f4f3de65096c65d57a32d8b3f553c7ac45d9143831330833f1"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
