class Kitcode < Formula
  desc "KitCode Agent is an AI agent built in Rust."
  homepage "https://github.com/taitide-labs/kitcode"
  version "0.1.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/taitide-labs/kitcode/releases/download/v0.1.12/kitcode-aarch64-apple-darwin.tar.gz"
      sha256 "68a100857a880283a40ddd352833015cc59bb31763c1cf66e48d14241d3feac7"
    end
    on_intel do
      url "https://github.com/taitide-labs/kitcode/releases/download/v0.1.12/kitcode-x86_64-apple-darwin.tar.gz"
      sha256 "a5caf6d6037c6a49db38ebf0c238f6129c441deedc3a322b07f6a78764cabf2b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/taitide-labs/kitcode/releases/download/v0.1.12/kitcode-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "555d787e94ee2559ce2a90311a9c85d0a2411d40e172aac35d62912d578c57fc"
    end
    on_intel do
      url "https://github.com/taitide-labs/kitcode/releases/download/v0.1.12/kitcode-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6fd885cefdece84eafc8b8098c4def03e89218a60478cd9257777a3e746898e1"
    end
  end

  def install
    bin.install "kitcode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kitcode --version")
  end
end
