class Kitcode < Formula
  desc "KitCode Agent is an AI agent built in Rust."
  homepage "https://github.com/taitide-labs/kitcode"
  version "0.1.14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/taitide-labs/kitcode/releases/download/v0.1.14/kitcode-aarch64-apple-darwin.tar.gz"
      sha256 "23a870df550737b28427d53686c82e8eeced9494d7eaee49bf5f0192650a7b37"
    end
    on_intel do
      url "https://github.com/taitide-labs/kitcode/releases/download/v0.1.14/kitcode-x86_64-apple-darwin.tar.gz"
      sha256 "1b060c6b0d75fc9024c2684a485ed56ba812b7ef8115ca3a36741c1d932d1d08"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/taitide-labs/kitcode/releases/download/v0.1.14/kitcode-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bce1f7c2c8c49f2198d58acd21d21af934d9832a6234dc24a4954080cc4afd2d"
    end
    on_intel do
      url "https://github.com/taitide-labs/kitcode/releases/download/v0.1.14/kitcode-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a15af53206222f744a15d8f4784614e9abfc51acdd63215cd136c28f40b1475f"
    end
  end

  def install
    bin.install "kitcode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kitcode --version")
  end
end
