class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.43"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.43/pikpaktui-aarch64-macos.tar.gz"
      sha256 "1e54a99775813a56f47ec9142d8d1ed2b6a0b8efbbbc2292f818d0ce9056b093"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.43/pikpaktui-x86_64-macos.tar.gz"
      sha256 "89cc33a495926622f31b46f2b1c3287465a86f78d2ee4c2d042c55c07f2b9a3d"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.43/pikpaktui-x86_64-linux.tar.gz"
    sha256 "ea90cd374c8f3886198fe66d619a2e477a05e2cbef6c2e298d29b51f21a198af"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
