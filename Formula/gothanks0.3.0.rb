class Gothanks030 < Formula
  desc "Automatically star your go.mod Github dependencies"
  homepage "https://github.com/psampaz/gothanks"
  url "https://github.com/psampaz/gothanks/archive/v0.3.0.tar.gz"
  sha256 "ce5440334b3eac2e058724faa4c6e4478ca1d81ea087e55ccca33f1996752aad"
  license "MIT"

  bottle do
    root_url "https://github.com/shehanrg/homebrew-test-tap-new/releases/download/gothanks-0.3.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "5d053469c63c91aedc5601369aeb0b6539aa932f1b59d4d1acc5419eff58b10c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0cdc54c0c270170608c093a8dc9e844246b2ce0ca78aaa5be5b0554b8d08013a"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    ENV.delete "GITHUB_TOKEN"
    assert_match "no Github token found", shell_output(bin/"gothanks", 255)
  end
end
