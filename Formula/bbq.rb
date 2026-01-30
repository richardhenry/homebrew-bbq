class Bbq < Formula
  desc "CLI and TUI for managing git worktrees"
  homepage "https://github.com/richardhenry/bbq"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/richardhenry/bbq/releases/download/v0.1.2/bbq-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "3042a1a8c71dd82116f6e1dbd2e010a78b080e883277f2d2a3fef6ca645a91af"
    else
      url "https://github.com/richardhenry/bbq/releases/download/v0.1.2/bbq-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "38a8e9edf62134758bd0d9667da66a727017afc0463156aa78c1518b733834b7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/richardhenry/bbq/releases/download/v0.1.2/bbq-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4b7a801ba8e4aecc994ad85b2a4ce7477c15fbbfe22e114cc4e0a0ef1d2a288e"
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
