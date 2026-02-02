class Bbq < Formula
  desc "CLI and TUI for managing git worktrees"
  homepage "https://github.com/richardhenry/bbq"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/richardhenry/bbq/releases/download/v0.1.6/bbq-v0.1.6-aarch64-apple-darwin.tar.gz"
      sha256 "2511a3c1beea2e36c719aa4264fb6144dad6fb6c07b67fd34fd7529fb9efe403"
    else
      url "https://github.com/richardhenry/bbq/releases/download/v0.1.6/bbq-v0.1.6-x86_64-apple-darwin.tar.gz"
      sha256 "f8e02a2c502b5f68cdfc9cf96f04edf7a6d8d980b74886620be55f8218cf8c8c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/richardhenry/bbq/releases/download/v0.1.6/bbq-v0.1.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c95e8dcf0b4cd101ab624a905eaa8e208d2f6a492fe84ab25e358c3e4740464e"
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
