class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.3.21"
  license "GPL-3.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.21/bcmr-aarch64-macos.tar.gz"
      sha256 "1583486905e65deb67c7facd5f293bf41cb771c4d1cde9bb41a8d8fe2b93954e"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.21/bcmr-x86_64-macos.tar.gz"
      sha256 "9b3a956fd6da8bdc8ac7a1d721d6eefeb2ddc6b36a2f7d58db48015e2cadfe2a"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.3.21/bcmr-x86_64-linux.tar.gz"
    sha256 "be33bbd7b14876f9d9261a96b0869a3f63dd0014584046464b8cf36542c8f848"
  end

  def install
    bin.install "bcmr"
  end

  test do
    system "#{bin}/bcmr", "--version"
  end
end
