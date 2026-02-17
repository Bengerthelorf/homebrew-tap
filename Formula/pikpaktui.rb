class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.33"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.33/pikpaktui-aarch64-macos.tar.gz"
      sha256 "04b778d37c4b7896fc725af7b4a8e81cca4d241e4a19bf34d16fc6100465fb27"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.33/pikpaktui-x86_64-macos.tar.gz"
      sha256 "ca739c814a0ecadbe3929dfc2fcfd697d4b3c4f9903d0eb11e6551efbc2b6b14"
    end
  elsif OS.linux?
    url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.33/pikpaktui-x86_64-linux.tar.gz"
    sha256 "c3630f0c342ce13b37ff9515ed24932bae71089c80af4c7f53aaccfcaf1d74b0"
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
