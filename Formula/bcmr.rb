class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.5.18"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.18/bcmr-aarch64-macos.tar.gz"
      sha256 "9574db536fb657c29b9a07e57cdca7932b813da4224dcc3eb19e04929cf9e86c"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.18/bcmr-x86_64-macos.tar.gz"
      sha256 "958fe4cac356b9729b90db807583955964f569f411d6f4231b02861486acab65"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.18/bcmr-x86_64-linux.tar.gz"
    sha256 "90509541f4b15f521b534830cd50e529f96d1ed995d35a7b8c0fb1ad722d6913"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
