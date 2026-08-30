class Kelos < Formula
  desc "Orchestrate autonomous AI coding agents on Kubernetes"
  homepage "https://github.com/kelos-dev/kelos"
  license "Apache-2.0"

  version "0.54.0"

  on_macos do
    on_intel do
      url "https://github.com/kelos-dev/kelos/releases/download/v#{version}/kelos-darwin-amd64"
      sha256 "1c428256ae4928ccdbc2ce152e6c4d674caedac661b2be7f21c737632faddeee"
    end
    on_arm do
      url "https://github.com/kelos-dev/kelos/releases/download/v#{version}/kelos-darwin-arm64"
      sha256 "04894822f78f82e8b4972b1ae267f90beb04cd3ecb23ac9ddf894340ee1e081f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/kelos-dev/kelos/releases/download/v#{version}/kelos-linux-amd64"
      sha256 "6dd7cb333f8844828b113fa9373cd3822fab6f95f0d49002991f9b6b4c01f41f"
    end
    on_arm do
      url "https://github.com/kelos-dev/kelos/releases/download/v#{version}/kelos-linux-arm64"
      sha256 "28a98654b4902ec916bb1639b68eae795415b940ea2db1b5f20572ff30a320c6"
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
