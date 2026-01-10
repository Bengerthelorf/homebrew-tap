class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.3.15"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.15/bcmr-aarch64-macos.tar.gz"
      sha256 "b21ede8615d6ccf10d598dc224137f2ab8c423e09ef0f1c570f9cf56e9cff1a5"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.15/bcmr-x86_64-macos.tar.gz"
      sha256 "4a24817d321328e1fcb60d11796ecdf735d3a8ea1172e2cb0a9829005e50f85b"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.15/bcmr-x86_64-linux.tar.gz"
    sha256 "6618270a138e584ab3e6f4ea4e4c649c4177421d2e8e4d0ee4d32aee84836e8a"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
