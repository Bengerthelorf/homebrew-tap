class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.3.13"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.13/bcmr-aarch64-macos.tar.gz"
      sha256 "62f365b2dfc206ff87ad04f8e378d3f5de4af2dcfa0fc5b258448a712c161692"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.13/bcmr-x86_64-macos.tar.gz"
      sha256 "98e01946a807c782b332edc43c0ca4cbc59997399bd5db355225dc60dab66b07"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.13/bcmr-x86_64-linux.tar.gz"
    sha256 "1250bff3cfdd7365037a708bcba7fc651b98a13c48d4f963cf4de69839971f43"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
