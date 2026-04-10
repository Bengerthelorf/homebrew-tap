class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.5.6"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.6/bcmr-aarch64-macos.tar.gz"
      sha256 "21b486350b53d43756925e62c46d655df17614ad14637bc3e019538b37ccd262"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.6/bcmr-x86_64-macos.tar.gz"
      sha256 "25689481bd3f1a955ac8767a3a820acced046c38a7e84e8efb3de8c461d1d401"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.6/bcmr-x86_64-linux.tar.gz"
    sha256 "fc40e5d82e6a28276961567ab85a0fe3f2dd5c0b95b624c985c40ecf59870175"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
