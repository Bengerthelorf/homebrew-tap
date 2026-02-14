class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.23"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.23/pikpaktui-aarch64-macos.tar.gz"
      sha256 "dc90e06bc1444cffa98ae79c9a1384fc302dce26f37c20c14aa82f9bb0ca95ac"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.23/pikpaktui-x86_64-macos.tar.gz"
      sha256 "522e3e00d1f19fe89a16e212eaf2b09a42df5b5f4fd947e0da57abdc70099ed6"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.23/pikpaktui-x86_64-linux.tar.gz"
    sha256 "7b7f75835034b830b6aaf0002d1d5ae356ee30225e99115b77fdf3bb83950980"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
