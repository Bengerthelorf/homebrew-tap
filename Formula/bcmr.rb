class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.4.5"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.5/bcmr-aarch64-macos.tar.gz"
      sha256 "c1054b6d812c43d69d854121cb6450c99519423beddadf5a3c7578082cb21d15"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.5/bcmr-x86_64-macos.tar.gz"
      sha256 "149b814d6f424c243ebe242535585a0fcdd3bb108818f32ded0584e2ef86a1cb"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.5/bcmr-x86_64-linux.tar.gz"
    sha256 "0a6871259909467fda6ea7e1a76f5f4d16f0dce512f4649fe08d38007679c017"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
