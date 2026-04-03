class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.5.1"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.1/bcmr-aarch64-macos.tar.gz"
      sha256 "e1495c39bd5480cb7ca6d2a95d5f28a08d3ab151b82714ccc645b617195d1084"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.1/bcmr-x86_64-macos.tar.gz"
      sha256 "5ea089da309c5b0f0d4df3dbdfef53b624531c85e9689f6178b7dfcf947f0912"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.5.1/bcmr-x86_64-linux.tar.gz"
    sha256 "a612d3d64c2da1eddc7ae782c558ea1e6e1f65becf3b78110947b36f47f9dc89"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
