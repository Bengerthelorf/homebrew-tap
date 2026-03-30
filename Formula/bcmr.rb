class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.4.16"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.16/bcmr-aarch64-macos.tar.gz"
      sha256 "67bdadee92af742d01a70042adde3cbaf17b5b821c9bc5a15f166095d6ac64d9"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.16/bcmr-x86_64-macos.tar.gz"
      sha256 "44d3d5a77519fc25ae8687c1cf31e93b434274cfae879f543aa1bbe301cd2cfb"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.16/bcmr-x86_64-linux.tar.gz"
    sha256 "883c63061147921cbc3c8a9bec691597a7ab5cb9e20999983b22371d8f5fe944"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
