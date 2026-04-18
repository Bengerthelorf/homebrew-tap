class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.5.16"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.16/bcmr-aarch64-macos.tar.gz"
      sha256 "133a2e46c8a9afd2dba2185df61cbbc3b267e6dd9b9de66647bcc3114ce7a3a0"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.16/bcmr-x86_64-macos.tar.gz"
      sha256 "4db7b61bd1e400d18ae5b8e7048a98b8e3f758f3e47f7dce3d8656095298cf42"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.16/bcmr-x86_64-linux.tar.gz"
    sha256 "ae45c5dec4950d4106939576a9619e77f801bbc47b2c7653faaf5e592fa4c973"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
