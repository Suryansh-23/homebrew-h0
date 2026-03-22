class H0 < Formula
  desc "Local-first sidecar harness for coding agents"
  homepage "https://github.com/Suryansh-23/h0"
  version "v0.1.0"
  license "MIT"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Suryansh-23/h0/releases/download/v0.1.0/h0-v0.1.0-darwin-arm64.tar.gz"
      sha256 "f4ecc22126bae25b772a57dd65c176576b331d27dd6cf57838287cc62ed22265"
    else
      url "https://github.com/Suryansh-23/h0/releases/download/v0.1.0/h0-v0.1.0-darwin-x64.tar.gz"
      sha256 "ac19d9369bb919ebe57477275449bd2cf47c242b66bba9d4a4d4eda767f6b18b"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Suryansh-23/h0/releases/download/v0.1.0/h0-v0.1.0-linux-arm64.tar.gz"
      sha256 "c99f00873f464b17f341e99038b71b666e9d73c28813f3572bdcf001c84271de"
    else
      url "https://github.com/Suryansh-23/h0/releases/download/v0.1.0/h0-v0.1.0-linux-x64.tar.gz"
      sha256 "7422d71d6f01350d7e23e3b201e5defe275185a7f89a584491cfb37767473101"
    end
  end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Suryansh-23/h0/releases/download/v0.1.0/h0-v0.1.0-linux-x64.tar.gz"
      sha256 "92fdb0f53bda84daf06f0aff708e368ae9d6e5edc20488a648704d7fb142eae0"
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
