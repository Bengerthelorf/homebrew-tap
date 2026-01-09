class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.3.4"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.5/bcmr-aarch64-macos.tar.gz"
      sha256 "7f31caea95609370a7d70aa5e8e9c6066917d5bea4a5f7010ef790dd617c37b0"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.5/bcmr-x86_64-macos.tar.gz"
      sha256 "901073215f4f33617e4b0c12a7ebbc5a7db70a2c02e5fc59a9047eabc86a63a4"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.5/bcmr-x86_64-linux.tar.gz"
    sha256 "bf563030ec4d02f6e5d166ed7d0fbc494f1b536fdf41ed3086906d1ae2e5261b"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
