class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.60"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.60/pikpaktui-aarch64-macos.tar.gz"
      sha256 "a69cde963cb0191b05816b1307c38eb78489e7e889d0e4c6e4ffb6346964de4f"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.60/pikpaktui-x86_64-macos.tar.gz"
      sha256 "74d159fc3c907522bc6a059a909570af0f9f1a8d650b82064a9d91db1088c4db"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.60/pikpaktui-aarch64-linux.tar.gz"
      sha256 "200cf014e24ec8a02190b2753ceeb02ceafbc6f4f6972d3925d198e4e1302836"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.60/pikpaktui-x86_64-linux.tar.gz"
      sha256 "7bc8bd503bc9f72f72d02d972a38205b610b6e07101a69f0732757720d60eaf3"
    end
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
