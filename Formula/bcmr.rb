class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.4.12"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.12/bcmr-aarch64-macos.tar.gz"
      sha256 "5d3ffad030ce2152e4e1a171ee45410de2187e1a3074edccb93280d087bec228"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.12/bcmr-x86_64-macos.tar.gz"
      sha256 "56e63e0581d81f31ff50a8c6a51d4a95e506c0c0ee10ffef6510d7250beeb62c"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.12/bcmr-x86_64-linux.tar.gz"
    sha256 "31f720f1ba6b523e2cfa913a17878b1876035fa71e40d832b603c96a70324f64"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
