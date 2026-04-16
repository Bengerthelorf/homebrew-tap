class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.5.15"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.15/bcmr-aarch64-macos.tar.gz"
      sha256 "f0c803b83293b09bfe0c1cb2a8c5686ba8f769455a990c81dd2b6dbae5c9f41e"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.15/bcmr-x86_64-macos.tar.gz"
      sha256 "6d0c4d70fd4772db15fe040757e7de9fb1260a332188979d6891d31833b3d27b"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.15/bcmr-x86_64-linux.tar.gz"
    sha256 "ae5a671c0d27b5b40e803f807578b8b398de09b3ccd96bec80e43bd719ee9a15"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
