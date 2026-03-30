class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.4.16"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.16/bcmr-aarch64-macos.tar.gz"
      sha256 "a5656dcdd9ec3e0b8c9afa019192ca36e86f9c16fe2c2e8ba42f539a2b9eaca6"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.16/bcmr-x86_64-macos.tar.gz"
      sha256 "92112d19ebf5305dcb1657ea96bedfb16c2f979621bf587a3f635b6d18676248"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.16/bcmr-x86_64-linux.tar.gz"
    sha256 "e905b49d2744c610d8608204930881623d233a51e9a5e861b19ff571a18f8cc8"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
