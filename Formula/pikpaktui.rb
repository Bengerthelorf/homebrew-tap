class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.5"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.5/pikpaktui-aarch64-macos.tar.gz"
      sha256 "bcea7a3bd51cf0b5329f9a61e22f85bbdc9e9911c7bff75710648f8cf4d8b011"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.5/pikpaktui-x86_64-macos.tar.gz"
      sha256 "860bef38fbe37e8befd8ecd269419704809e4d0653cdcc0cff4762ab5c1f61f6"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.5/pikpaktui-x86_64-linux.tar.gz"
    sha256 "376d721c7ec64d837cd347348c8ecf99a768fddbc7561b64221e450c22c7def0"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
