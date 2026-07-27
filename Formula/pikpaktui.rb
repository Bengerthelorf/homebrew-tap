class Pikpaktui < Formula
  desc "A TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  version "0.0.57"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.57/pikpaktui-aarch64-macos.tar.gz"
      sha256 "9f2f4268c786fb2c07dffce0f1f4f1b8236d9b4059f17879398b846747a5ab32"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.57/pikpaktui-x86_64-macos.tar.gz"
      sha256 "317dc2bb0b2f2a030c0a76c72be75e05627c9bd73567e1ba94613cd6849f3bea"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.57/pikpaktui-aarch64-linux.tar.gz"
      sha256 "e41fb586556f61d017e75c282d7250f153992c36ad3e1f3f57af3fe696501fd7"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.57/pikpaktui-x86_64-linux.tar.gz"
      sha256 "5cedcbd3c68bf9f7ef34bd845b70afda096b2dc657fbb82669d2360c79ce5c52"
    end
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    system "#{bin}/pikpaktui", "--version"
  end
end
