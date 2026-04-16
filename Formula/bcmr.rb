class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.5.14"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.14/bcmr-aarch64-macos.tar.gz"
      sha256 "35664039f8b21250ad7263ae39c73ffc9239cc6577dc086d24779a6dc4315f00"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.14/bcmr-x86_64-macos.tar.gz"
      sha256 "05df56ce222b4f8b5c71148b808ef4d22a2b3c8cac08771c537d73c84a0bb0e3"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.14/bcmr-x86_64-linux.tar.gz"
    sha256 "14edf403263db0abd02305fccca74c474269c1e16b72da5412953048c0d2ff2e"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
