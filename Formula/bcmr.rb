class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.4.9"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.9/bcmr-aarch64-macos.tar.gz"
      sha256 "aa5a72f4235ba1fb8ffc86927c4f8c2f862d81b0d90d7e891317bd2769e3cd04"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.9/bcmr-x86_64-macos.tar.gz"
      sha256 "1bb89841636e22a27d7c7d672ef86abc0c34766cd88cd57f4f50878835758b6b"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.9/bcmr-x86_64-linux.tar.gz"
    sha256 "7036614326cf837307dd85ecacf96bf8ba1754de1daeea26020498d851fa46c1"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
