class AwsSsoCli < Formula
  desc "Securely manage AWS API credentials using AWS SSO"
  homepage "https://github.com/synfinatic/aws-sso-cli"
  url "https://github.com/synfinatic/aws-sso-cli/archive/refs/tags/v1.2.2.tar.gz"
  sha256 "a53acdbc428d23368cc00f6c9cde17bb40d3afe584f80dea2eec3c9cfac617e8"

  depends_on :xcode
  depends_on "go" => [:build]

  def install
    ENV["BREW_INSTALL"] = "1"
    ENV["PROJECT_COMMIT"] = "593ba557cb37ea0a2f7ac5d8f0ac1e7df9be3074"

    system "make"
    bin.install "./dist/aws-sso"
  end

  test do
    assert_match /AWS SSO CLI Version 1.2.2/, shell_output("#{bin}/aws-sso version")
    assert_match /Please specify --sso/, shell_output("#{bin}/aws-sso --config /dev/null  2>&1")
  end
end
