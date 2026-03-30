class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.4.18"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.18/bcmr-aarch64-macos.tar.gz"
      sha256 "c96d475acd8f05c0d6646010cfcab07e8ccdf5c7ff1aa38b0c2d7486bdc5fda2"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.18/bcmr-x86_64-macos.tar.gz"
      sha256 "18fd5b8d498a46b9a6cc67aa69dc2585c0e751dc2b5777a53070c320963ab3a1"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.18/bcmr-x86_64-linux.tar.gz"
    sha256 "4fafd6ba96502535b2556472ee1cfff5331ff6efe5ab799751dc1edbed630b65"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
