class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.52"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.52/pikpaktui-aarch64-macos.tar.gz"
      sha256 "561c8e1d25b9577bfe61e11840cea9e5044f1e520964abd155068a16926b23f9"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.52/pikpaktui-x86_64-macos.tar.gz"
      sha256 "1805a352edd9bf0a8865051e714cfe4a4aea3e7fadb52b0fa956df9d24683b53"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.52/pikpaktui-x86_64-linux.tar.gz"
    sha256 "cdc53afb4af9e14836624cc10e939f48377c13c72f16dee366c09ef41959f035"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
