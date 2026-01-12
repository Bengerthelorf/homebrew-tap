class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.3.23"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.23/bcmr-aarch64-macos.tar.gz"
      sha256 "0e919a4f9bfd81eef1511ed396b0a8770871d73bae24d6a96ff843d98fc3b84b"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.23/bcmr-x86_64-macos.tar.gz"
      sha256 "e82201649aebbbb5cb29ca445f58814b778b5bce605f6f3748e1f9a005e7ddb0"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.23/bcmr-x86_64-linux.tar.gz"
    sha256 "95dc696fe8d51cff84ae6225de5adb80871ff9983ead2f5bbac4da6169046c23"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
