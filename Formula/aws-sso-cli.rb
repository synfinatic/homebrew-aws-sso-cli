class AwsSsoCli < Formula
  desc "Securely manage AWS API credentials using AWS SSO"
  homepage "https://github.com/synfinatic/aws-sso-cli"
  url "https://github.com/synfinatic/aws-sso-cli/archive/refs/tags/v1.9.3.tar.gz"
  sha256 "16fbaf845d921fb0e7cbb5e8b43e9b119fbff39cefebac174b4aa6d7e79f115c"

  depends_on :xcode
  depends_on "go" => [:build, "1.17.0"]

  def install
    ENV["BREW_INSTALL"] = "1"
    ENV["PROJECT_COMMIT"] = "cc2815db354c12f7e915c2255ab6ca2bff643104"

    system "make"
    bin.install "./dist/aws-sso"
  end

  test do
    assert_match /AWS SSO CLI Version 1.9.3/, shell_output("#{bin}/aws-sso version")
    assert_match /Please specify --sso/, shell_output("#{bin}/aws-sso --config /dev/null  2>&1")
  end
end
