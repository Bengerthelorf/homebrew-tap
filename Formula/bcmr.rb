class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.5.9"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.9/bcmr-aarch64-macos.tar.gz"
      sha256 "b124a81f314fe0c79520eed5b71454b8ce35c42c2ec11a554a17b8437db5da8b"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.9/bcmr-x86_64-macos.tar.gz"
      sha256 "4981ecb5b4612f16f8a509f3e8c809fc5231ab633c59c219505fde912f4ec05c"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.9/bcmr-x86_64-linux.tar.gz"
    sha256 "7c54621e2164894dd584a6b3a88c3e23a01e903ee82aa87a82f265c788ccb35f"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
