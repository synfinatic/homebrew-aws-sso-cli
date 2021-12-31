class AwsSsoCli < Formula
  desc "Securely manage AWS API credentials using AWS SSO"
  homepage "https://github.com/synfinatic/aws-sso-cli"
  url "https://github.com/synfinatic/aws-sso-cli/archive/refs/tags/v1.6.1.tar.gz"
  sha256 "b2fc7a8d89ac638425713ca434fcb31a1ad1bbe80a6fdde23e566d7f04e6034b"

  depends_on :xcode
  depends_on "go" => [:build, "1.17.0"]

  def install
    ENV["BREW_INSTALL"] = "1"
    ENV["PROJECT_COMMIT"] = "55a5d8e55ff1119e9c760ccdddfc3ad82ff092fe"

    system "make"
    bin.install "./dist/aws-sso"
  end

  test do
    assert_match /AWS SSO CLI Version 1.6.1/, shell_output("#{bin}/aws-sso version")
    assert_match /Please specify --sso/, shell_output("#{bin}/aws-sso --config /dev/null  2>&1")
  end
end
