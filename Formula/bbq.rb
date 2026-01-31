class Bbq < Formula
  desc "CLI and TUI for managing git worktrees"
  homepage "https://github.com/richardhenry/bbq"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/richardhenry/bbq/releases/download/v0.1.5/bbq-v0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "84a7eefb70e1fcb625bb53fa9a652f28094386bf5546fae52e1bd4c2de3070f1"
    else
      url "https://github.com/richardhenry/bbq/releases/download/v0.1.5/bbq-v0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "efc7ba1af7cc7e6fb7cb1b75c29cd219a03fa4ecc365578ef05d40719d497539"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/richardhenry/bbq/releases/download/v0.1.5/bbq-v0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f3c6403bd518aa37b17475f5a09b8c20b01bf67bc630d00d24cb8201e6cd63ac"
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
