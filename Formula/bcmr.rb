class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.4.15"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.15/bcmr-aarch64-macos.tar.gz"
      sha256 "304273c16c267591c2e51ee43d2c4fe9c25a3b30d20a7e14f86a5fcf31908b23"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.15/bcmr-x86_64-macos.tar.gz"
      sha256 "2351bfaf7e68e0632480a9d60fb3943f732d7f1abc6376a45af7642db7690fb8"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.15/bcmr-x86_64-linux.tar.gz"
    sha256 "b690f2735c8585f180174e8fe9a5932a46afd54a0758dfe8d1b51061b1cd793d"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
