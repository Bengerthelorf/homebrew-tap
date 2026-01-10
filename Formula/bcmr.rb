class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.3.16"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.16/bcmr-aarch64-macos.tar.gz"
      sha256 "19b2ed4520f2e7071dbb3ce747567303593bcdd6d6e0ae7aca33916f3c3442d1"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.16/bcmr-x86_64-macos.tar.gz"
      sha256 "ec5d0b8caa2b3ef7cc931e244fa7e33102a2fa5b2cc1aacc661a3fe74290cba4"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.16/bcmr-x86_64-linux.tar.gz"
    sha256 "f0c24559052f622f7d87cd8289b5e31c48b790fad39e030e0d20a40f38237052"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
