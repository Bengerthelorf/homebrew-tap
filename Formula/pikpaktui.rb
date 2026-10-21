class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.61"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.61/pikpaktui-aarch64-macos.tar.gz"
      sha256 "4e911d89f619e86c8094a3b3c050c855af7ac1daf094622aaddcd0375ff16048"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.61/pikpaktui-x86_64-macos.tar.gz"
      sha256 "f393fdfccdaf5519564e884dcac819ed0701636c7c82de8fbd19dbed466ce551"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.61/pikpaktui-aarch64-linux.tar.gz"
      sha256 "9256af2d297c870e3233cbe14a3cdb7f32154ea062a5267333bb3e8d8729de03"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.61/pikpaktui-x86_64-linux.tar.gz"
      sha256 "eed550ee9ec2a70df7c6a4515a3d239933457b6b73f992261c33c020708561bb"
    end
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
