class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.41"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.41/pikpaktui-aarch64-macos.tar.gz"
      sha256 "462c6c5b7dccbb57946d7baaabecf9b62fa54030476ac4f485d600541fd6ab50"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.41/pikpaktui-x86_64-macos.tar.gz"
      sha256 "d1e4f69165d89d28a160be89be3cbf896563529f950b76daeba92a8f22002e75"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.41/pikpaktui-x86_64-linux.tar.gz"
    sha256 "d35d0c26b56a8825e0a2ee5d39c73b7f0220b49d9cfe325e86e3f9242df2b79a"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
