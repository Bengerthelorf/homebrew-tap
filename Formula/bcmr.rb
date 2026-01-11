class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.3.20"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.20/bcmr-aarch64-macos.tar.gz"
      sha256 "12783def853ccad9faf33d45872565ff8173a32298ee810af7343bc0057d23f7"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.20/bcmr-x86_64-macos.tar.gz"
      sha256 "687ccc2bff32303cddb03fd71fa14cac5112e22f8ebf14333d0cfa07adfcb75d"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.20/bcmr-x86_64-linux.tar.gz"
    sha256 "a737536207cc64483aebf3754e2bd2c7879d60e0a274a1ce0209d25f8055c992"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
