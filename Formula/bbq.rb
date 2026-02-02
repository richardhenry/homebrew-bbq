class Bbq < Formula
  desc "CLI and TUI for managing git worktrees"
  homepage "https://github.com/richardhenry/bbq"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/richardhenry/bbq/releases/download/v0.1.7/bbq-v0.1.7-aarch64-apple-darwin.tar.gz"
      sha256 "4e0c567ed3c80b590700aa1ef9eaa0742f01bcdd109f656e3dd5b352045660e2"
    else
      url "https://github.com/richardhenry/bbq/releases/download/v0.1.7/bbq-v0.1.7-x86_64-apple-darwin.tar.gz"
      sha256 "c5388939f587040beb78163b21a449500d741fb1226ea2c215f58549efc35bec"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/richardhenry/bbq/releases/download/v0.1.7/bbq-v0.1.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8ef8a2b1a88c652ba981826316d07408a805931c260693f9020cd0ea9f59f377"
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
