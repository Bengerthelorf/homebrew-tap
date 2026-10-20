class Bcmr < Formula
  desc "Better Copy Move Remove - A modern, safe file operation tool"
  homepage "https://github.com/Bengerthelorf/bcmr"
  version "0.7.0"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.7.0/bcmr-aarch64-macos.tar.gz"
      sha256 "57d239ea88bdea391b82bb0d46f06436f87887467f6c6f95f2197db2a81e4497"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.7.0/bcmr-x86_64-macos.tar.gz"
      sha256 "a7eebc95558fe24e6e51d8ae49492b253f9662a08f735ee501cf275c1111c849"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.7.0/bcmr-aarch64-linux.tar.gz"
      sha256 "d4f451b6009c63f32a63d218fda015c6860d02a3fbe2e82980565c0b70c0da46"
    else
      url "https://github.com/Bengerthelorf/bcmr/releases/download/v0.7.0/bcmr-x86_64-linux.tar.gz"
      sha256 "3a269a8dafbff7f1250e3792ab8f6966801d1245ce52340bd7a196da68dd8f79"
    end
  end

  def install
    bin.install "bcmr"
    generate_completions_from_executable(bin/"bcmr", "completions", shells: [:bash, :zsh, :fish])
  end

  def caveats
    <<~EOS
      To enable bcp, bmv and brm in Zsh, add to ~/.zshrc:
        eval "$(bcmr init zsh --cmd b)"
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bcmr --version")
    assert_path_exists bash_completion/"bcmr"
    assert_path_exists zsh_completion/"_bcmr"
    assert_path_exists fish_completion/"bcmr.fish"
  end
end
