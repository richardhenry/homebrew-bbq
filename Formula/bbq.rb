class Bbq < Formula
  desc "CLI and TUI for managing git worktrees"
  homepage "https://github.com/richardhenry/bbq"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/richardhenry/bbq/releases/download/v0.1.4/bbq-v0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "62383b6a4f8f4d10b8312e7aa867c4148ca4bfc2323a7bbfe588f84ce078ca5d"
    else
      url "https://github.com/richardhenry/bbq/releases/download/v0.1.4/bbq-v0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "b0baa81a599cbc2969936f16be0f1a7aafe4c26da5b161624882b4906cee53fd"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/richardhenry/bbq/releases/download/v0.1.4/bbq-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f910b7b934e6a6603e51ea656113d38b09e3f02863c1edf6a75b0a15d69b0bf9"
    else
      odie "bbq is not available for Linux ARM"
    end
  end

  def install
    bin.install "bbq"
  end

  test do
    assert_match "bbq", shell_output("#{bin}/bbq --help")
  end
end
