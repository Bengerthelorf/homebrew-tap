class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.4.6"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.6/bcmr-aarch64-macos.tar.gz"
      sha256 "fd72883f491a7d2a78a89632d06ef66e6ce5cc65018a88c4e6bb66af0c0a31de"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.6/bcmr-x86_64-macos.tar.gz"
      sha256 "978a94bb48b7bb5cfca015a2646140c39cf0595684f65ae25b3f9c15ecd09a25"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.6/bcmr-x86_64-linux.tar.gz"
    sha256 "6d6ac744321cd3aaa1864fa7d99b402a35503a9ca3520b434cca92a3a797ccfa"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
