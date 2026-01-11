class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.3.22"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.22/bcmr-aarch64-macos.tar.gz"
      sha256 "45343b1f24a28a91f1541816326e6e0965af5e5b222be082f8e4668a0e834080"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.22/bcmr-x86_64-macos.tar.gz"
      sha256 "f0e5b59fd5b68d8b21d85ddfe87beddd441a92bebc333b7aacda06c8cf50d199"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.22/bcmr-x86_64-linux.tar.gz"
    sha256 "970bb1d049db6407d8cd68f6ccc5f36ee95f8483d262a56a537e50d6a0cd4245"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
