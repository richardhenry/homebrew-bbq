class Bbq < Formula
  desc "CLI and TUI for managing git worktrees"
  homepage "https://github.com/richardhenry/bbq"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/richardhenry/bbq/releases/download/v0.1.3/bbq-v0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "ef470c086aed2e04308edf804e3eccffa27657f78c5f2084da095d241885f6f6"
    else
      url "https://github.com/richardhenry/bbq/releases/download/v0.1.3/bbq-v0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "a33ac15e2c66d9ffc4e44354a2cae1d8533823e1a49c9d96caabb06c3908b31a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/richardhenry/bbq/releases/download/v0.1.3/bbq-v0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "32796c1723b1e9bc9bd376cd5709b74ac313d805d0df73f339f1ceefd4db586f"
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
