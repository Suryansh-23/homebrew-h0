class H0 < Formula
  desc "Local-first sidecar harness for coding agents"
  homepage "https://github.com/Suryansh-23/h0"
  version "v0.1.0"
  license "MIT"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Suryansh-23/h0/releases/download/v0.1.0/h0-v0.1.0-darwin-arm64.tar.gz"
      sha256 "REPLACE_WITH_REAL_SHA256_DARWIN_ARM64"
    else
      url "https://github.com/Suryansh-23/h0/releases/download/v0.1.0/h0-v0.1.0-darwin-x64.tar.gz"
      sha256 "REPLACE_WITH_REAL_SHA256_DARWIN_X64"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Suryansh-23/h0/releases/download/v0.1.0/h0-v0.1.0-linux-arm64.tar.gz"
      sha256 "REPLACE_WITH_REAL_SHA256_LINUX_ARM64"
    else
      url "https://github.com/Suryansh-23/h0/releases/download/v0.1.0/h0-v0.1.0-linux-x64.tar.gz"
      sha256 "REPLACE_WITH_REAL_SHA256_LINUX_X64"
    end
  end
  depends_on "sqlite"
  def install
    bin.install "h0"
    if OS.mac?
      libexec.install "vec0.dylib"
    else
      libexec.install "vec0.so"
    end
  end
  def caveats
    <<~EOS
      h0 uses sqlite-vec and requires extension-capable SQLite.
      This formula depends on Homebrew sqlite.
      After install, run:
        h0 doctor
    EOS
  end
  test do
    output = shell_output("#{bin}/h0 doctor", 1)
    assert_match "h0 doctor", output
  end
end
