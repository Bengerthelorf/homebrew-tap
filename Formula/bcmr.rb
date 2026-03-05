class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.3.28"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.28/bcmr-aarch64-macos.tar.gz"
      sha256 "0d87aaf20ba5e360ee2d5e2e89c0ab7084c23d104cbd2e66ed1a1dc7a6c2df57"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.28/bcmr-x86_64-macos.tar.gz"
      sha256 "565b4222fbcf4ff5c83a038ea15da3bc625a9547fec0d32e7fef6d83436f69ba"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.28/bcmr-x86_64-linux.tar.gz"
    sha256 "aea9ff3377d1f3f3d09714374ac80a7911bb39a425c13cb80e2d236ce9e1ce4d"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
