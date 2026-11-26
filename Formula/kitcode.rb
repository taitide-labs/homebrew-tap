class Kitcode < Formula
  desc "KitCode Agent is an AI agent built in Rust."
  homepage "https://github.com/taitide-labs/kitcode"
  version "0.1.16"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/taitide-labs/kitcode/releases/download/v0.1.16/kitcode-aarch64-apple-darwin.tar.gz"
      sha256 "655b3e6f249fbbfc0c8b32f7c614a9c4ac10426d68b7c940e335a564739caafd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/taitide-labs/kitcode/releases/download/v0.1.16/kitcode-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "498aa635a5f0179cfdda82e8b3d168d371688dea0336cf2291a1feaecbe65ae7"
    end
    on_intel do
      url "https://github.com/taitide-labs/kitcode/releases/download/v0.1.16/kitcode-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cec75345ffce1c452e277d7c210389ad825e34012448d2f8b15b5bdf8be1b1f1"
    end
  end

  def install
    bin.install "kitcode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kitcode --version")
  end
end
