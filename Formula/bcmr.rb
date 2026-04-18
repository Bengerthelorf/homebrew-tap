class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.5.17"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.17/bcmr-aarch64-macos.tar.gz"
      sha256 "02b67ba8ed3a94430fcb7ad27c3ce010da93397197b1291b66c0577f4e53b23f"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.17/bcmr-x86_64-macos.tar.gz"
      sha256 "71aee89b2ffcddd876ab363fc63b5b2c5813bf3b491d7b0ca15fc8a86ea3d9c2"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.17/bcmr-x86_64-linux.tar.gz"
    sha256 "21e6bef98609daeb98951d7e038bd89f0c4c13732a6057d6c5aae4381dcef509"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
