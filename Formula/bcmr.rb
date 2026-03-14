class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.4.4"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.4/bcmr-aarch64-macos.tar.gz"
      sha256 "31cfbae242c08de97f173641e9d25151abba5999ec9f89d4f117c6a012e726bb"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.4/bcmr-x86_64-macos.tar.gz"
      sha256 "826c4ada9aa17f35557476d5df3a78c113bb906f1974e14e12fc865d57959c32"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.4.4/bcmr-x86_64-linux.tar.gz"
    sha256 "ebb8bf84928911582053e96035971b8b86a2af7975552f5fcb246ed0e0e042fe"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
