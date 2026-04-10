class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.5.5"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.5/bcmr-aarch64-macos.tar.gz"
      sha256 "9a9674892720a512457aec625426dc9ac58fcce892cb4ab6c7e2495b5275efae"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.5/bcmr-x86_64-macos.tar.gz"
      sha256 "c33378bd8dfd067085f618fbcb9f1ce54ae4a7a173f61f7e73e87c90c2b91fba"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.5/bcmr-x86_64-linux.tar.gz"
    sha256 "e32044a9e06e097bdfb334597a174d5b9d87d47f3ab3f82300176630d84d296f"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
