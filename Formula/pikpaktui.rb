class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.52"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.52/pikpaktui-aarch64-macos.tar.gz"
      sha256 "f00edc5627b3a8f37ae064df8c1a34374979cae34f82da7449e15cefa8fd4407"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.52/pikpaktui-x86_64-macos.tar.gz"
      sha256 "44ae138232e32b82c530116824165470ad3f2ab4a0a7473ff909af5526d055b5"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.52/pikpaktui-x86_64-linux.tar.gz"
    sha256 "8e2e8536474459326e4028a45b9ba96affc7b8b0f1665962ae7362febec96da5"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
