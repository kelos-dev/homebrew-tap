class Kelos < Formula
  desc "Orchestrate autonomous AI coding agents on Kubernetes"
  homepage "https://github.com/kelos-dev/kelos"
  license "Apache-2.0"

  version "0.32.0"

  on_macos do
    on_intel do
      url "https://github.com/kelos-dev/kelos/releases/download/v#{version}/kelos-darwin-amd64"
      sha256 "b7bf7c4a092a321581151b04dfb4faef65460eab824489623563dfb88c845626"
    end
    on_arm do
      url "https://github.com/kelos-dev/kelos/releases/download/v#{version}/kelos-darwin-arm64"
      sha256 "30022c2145c0aea56604778d5df2e018d4dfd06a7ae8e8fdc4a0874c0d3f2eb1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/kelos-dev/kelos/releases/download/v#{version}/kelos-linux-amd64"
      sha256 "fd6c8bc8b4a19d5885b3fc7b8f7b69307b21c8efe5be7c6cfa782b12956f9b9c"
    end
    on_arm do
      url "https://github.com/kelos-dev/kelos/releases/download/v#{version}/kelos-linux-arm64"
      sha256 "d2e8b47ef574dcd50e134c8fcecf9e4060f2a160db94d08c1f2df9fd37d18246"
    end
  end

  def install
    # Homebrew downloads the binary with the URL's filename,
    # so we just rename it and install
    bin.install Dir.glob("kelos-*").first => "kelos"
  end

  test do
    output = shell_output("#{bin}/kelos version")
    assert_match(/\d+\.\d+\.\d+/, output)
  end
end
