class Kelos < Formula
  desc "Orchestrate autonomous AI coding agents on Kubernetes"
  homepage "https://github.com/kelos-dev/kelos"
  license "Apache-2.0"

  version "0.43.0"

  on_macos do
    on_intel do
      url "https://github.com/kelos-dev/kelos/releases/download/v#{version}/kelos-darwin-amd64"
      sha256 "4cdfd50fdb83011deec41d6b062becea857493d5505c749f6ab710c4174f37b0"
    end
    on_arm do
      url "https://github.com/kelos-dev/kelos/releases/download/v#{version}/kelos-darwin-arm64"
      sha256 "4de0dc24d7f350f89910b64b45feb715cbb1b17f90f67b364388035a3cd41564"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/kelos-dev/kelos/releases/download/v#{version}/kelos-linux-amd64"
      sha256 "4beb330f4ac2eff7b106c375fbafc4ba442d66df52ee1dda4863a7f259596bc1"
    end
    on_arm do
      url "https://github.com/kelos-dev/kelos/releases/download/v#{version}/kelos-linux-arm64"
      sha256 "acc2c694b73e79c496d4d2ad1bdf315d627b652f4951f2961c169b1d28e8e790"
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
