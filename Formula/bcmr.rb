class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.3.26"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.26/bcmr-aarch64-macos.tar.gz"
      sha256 "4c524207de8c1bb480f49f8434717f4d51dded95c156e2727ed185f336488518"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.26/bcmr-x86_64-macos.tar.gz"
      sha256 "a6d9371bb2b9895548786e67ba912a1bc100e8b57fb05448f705864aa2ddd482"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.26/bcmr-x86_64-linux.tar.gz"
    sha256 "ae23db8837c46833fb10d8c7e69a16722a20fd940bb89e0ac907c41055010784"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
