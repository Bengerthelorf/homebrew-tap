class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.31"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.31/pikpaktui-aarch64-macos.tar.gz"
      sha256 "947f4925b8fb0b514297d162e8066f20976c3378f08fc1271101f6070c454b8f"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.31/pikpaktui-x86_64-macos.tar.gz"
      sha256 "457a63bc6749b97a71df5747664693ee36e2be70fb0602d85f620599584a89fb"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.31/pikpaktui-x86_64-linux.tar.gz"
    sha256 "f67f081688adc223f058f3ab511afc646b2aa4174bf34288a686ce1d896ab3ba"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
