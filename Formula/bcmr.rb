class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.6.2"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.6.2/bcmr-aarch64-macos.tar.gz"
      sha256 "682f1cca40e50027ebcf555f73f57add0dbeca6670ee6f609e091e60b684132d"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.6.2/bcmr-x86_64-macos.tar.gz"
      sha256 "67b7a000d7f09ef6b308bfaa4983b2b6c245446b2d020c378b59d5f10d156929"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.6.2/bcmr-x86_64-linux.tar.gz"
    sha256 "008065790a476e03dd6f0f998ccc5ad0a5055b862523623dc558feafd6c817ff"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
