class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.3.9"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.9/bcmr-aarch64-macos.tar.gz"
      sha256 "f00bfd2b3a834544433f1dcb2462300dd3fac7f5d44cc775e285b034c25411e6"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.9/bcmr-x86_64-macos.tar.gz"
      sha256 "7bb009d528df814d029a21648c923ae55ceecaded5037939b50d1f75a99649ff"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.9/bcmr-x86_64-linux.tar.gz"
    sha256 "73cbffa30e2ef658be64ce2148906f69f3d9abf1e6e138ac5ece0c9b57fb2b0a"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
