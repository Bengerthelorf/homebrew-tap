class Pikpaktui < Formula
  desc "TUI and CLI client for PikPak cloud storage"
  homepage "https://github.com/Bengerthelorf/pikpaktui"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.66/pikpaktui-aarch64-macos.tar.gz"
      sha256 "990fd0bb38cfcdc409259d0f0f135deaecbb505359615ad4dd0361f114f8f53f"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.66/pikpaktui-x86_64-macos.tar.gz"
      sha256 "7eb2db4b12e5e07a67767a8b3ef20ece5b1cd80b134d5a8cbd8b9a90ffbfd855"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.66/pikpaktui-aarch64-linux.tar.gz"
      sha256 "4d517a6ed2c7fca5fe865c0d17e3f106f3ad5a30a481c94e139c9e00188cf37d"
    else
      url "https://github.com/Bengerthelorf/pikpaktui/releases/download/v0.0.66/pikpaktui-x86_64-linux.tar.gz"
      sha256 "fa39cf8f690749e1597b31591690f521a9affad49d80d261049815f095f63b5e"
    end
  end

  def install
    bin.install "pikpaktui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pikpaktui --version")
  end
end
