class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.6.1"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.6.1/bcmr-aarch64-macos.tar.gz"
      sha256 "2a483dd2e1e8ef0a71f8a0caec9356b89e2c60527ceddebe76e8be44f0dd62b2"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.6.1/bcmr-x86_64-macos.tar.gz"
      sha256 "3c840b911be8accdcc9cbe213e195baeb7af8373ed8cb29d7b5276ea0c1c34fe"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.6.1/bcmr-x86_64-linux.tar.gz"
    sha256 "e967a07dd64b5ec4d9198982ea11b844fdbc517e36b007b8788556d43c0cd0cc"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
