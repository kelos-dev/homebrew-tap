class Kelos < Formula
  desc "Orchestrate autonomous AI coding agents on Kubernetes"
  homepage "https://github.com/kelos-dev/kelos"
  license "Apache-2.0"

  version "0.42.0"

  on_macos do
    on_intel do
      url "https://github.com/kelos-dev/kelos/releases/download/v#{version}/kelos-darwin-amd64"
      sha256 "68669edca98b08de96511ccff4a7007b5f9b292bd3cf44dcd3316b6115c30e3e"
    end
    on_arm do
      url "https://github.com/kelos-dev/kelos/releases/download/v#{version}/kelos-darwin-arm64"
      sha256 "91a3c6f57be09fb68258b8e69f39cd0a88e0319a20f2077b72474c7052b10aac"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/kelos-dev/kelos/releases/download/v#{version}/kelos-linux-amd64"
      sha256 "3b4bf35cbda8cdfb1b0cf734e8f24c24a610a76b68244e1afeef7c07ebd3144f"
    end
    on_arm do
      url "https://github.com/kelos-dev/kelos/releases/download/v#{version}/kelos-linux-arm64"
      sha256 "8e0b8ab6960c92a7e0896b7d3ebaa43b1c4240033a3c15d89d4ec3b17997d0af"
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
