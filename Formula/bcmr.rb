class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.3.30"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.30/bcmr-aarch64-macos.tar.gz"
      sha256 "52707a1260001eee089909b8edd136cc86858fd05ed92321b60d65c758cf1fea"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.30/bcmr-x86_64-macos.tar.gz"
      sha256 "ee8870db94c4c53e9d05af75a01e2dd3c70cc83103881d4a19fd8fc400139c6c"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.30/bcmr-x86_64-linux.tar.gz"
    sha256 "24898fbf3f7a1d9b8f33813600f1371068f4cca0f386bdd9439a7f94a7f6feaa"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
