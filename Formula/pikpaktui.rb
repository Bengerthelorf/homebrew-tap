class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.50"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.50/pikpaktui-aarch64-macos.tar.gz"
      sha256 "60ce164f4f87722e3281b67185dc6b5d9973c4387bf4c3c43ba33a103cf94231"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.50/pikpaktui-x86_64-macos.tar.gz"
      sha256 "005077904b16055c9a99ccb9171b80bc6e1fa0b9651497ea7fe98c6b8df6e5c1"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.50/pikpaktui-x86_64-linux.tar.gz"
    sha256 "2a0cd3cf85162834c815066dda4574eaff3498d976cb6bed41eab1df4a96737b"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
