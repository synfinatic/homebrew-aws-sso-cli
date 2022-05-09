class AwsSsoCli < Formula
  desc "Securely manage AWS API credentials using AWS SSO"
  homepage "https://github.com/synfinatic/aws-sso-cli"
  url "https://github.com/synfinatic/aws-sso-cli/archive/refs/tags/v1.9.0.tar.gz"
  sha256 "6602c46460f85f54c5404802f52c64d2abe05362b563d809ee6db58bd760c435"

  depends_on :xcode
  depends_on "go" => [:build, "1.17.0"]

  def install
    ENV["BREW_INSTALL"] = "1"
    ENV["PROJECT_COMMIT"] = "00620eb76250dd7c4f299521730a82a87310bf40"

    system "make"
    bin.install "./dist/aws-sso"
  end

  test do
    assert_match /AWS SSO CLI Version 1.9.0/, shell_output("#{bin}/aws-sso version")
    assert_match /Please specify --sso/, shell_output("#{bin}/aws-sso --config /dev/null  2>&1")
  end
end
