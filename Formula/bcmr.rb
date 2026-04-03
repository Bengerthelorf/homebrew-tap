class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.5.2"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.2/bcmr-aarch64-macos.tar.gz"
      sha256 "be09510e6437a5818864191582772ed23f1dfe020525e425f60450babecd875c"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.2/bcmr-x86_64-macos.tar.gz"
      sha256 "665507db7aac5ffcf70f9c65e6e58e511bc8540c07448093e26c7a8c6e782760"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.2/bcmr-x86_64-linux.tar.gz"
    sha256 "0ccd0b767a78c49431b2fd8b89df7f24c022bb0e53dc451897b5d7740269a40f"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
