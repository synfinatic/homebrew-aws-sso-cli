class AwsSsoCli < Formula
  desc "Securely manage AWS API credentials using AWS SSO"
  homepage "https://github.com/synfinatic/aws-sso-cli"
  url "https://github.com/synfinatic/aws-sso-cli/archive/refs/tags/v1.7.5.tar.gz"
  sha256 "cc7248f5e00878f47fb4a5a7ded7c2dd5507efb1a13fdb7ae034f6251d3dd2ee"

  depends_on :xcode
  depends_on "go" => [:build, "1.17.0"]

  def install
    ENV["BREW_INSTALL"] = "1"
    ENV["PROJECT_COMMIT"] = "32a73fac4dbab563f55e151f897178349435247b"

    system "make"
    bin.install "./dist/aws-sso"
  end

  test do
    assert_match /AWS SSO CLI Version 1.7.5/, shell_output("#{bin}/aws-sso version")
    assert_match /Please specify --sso/, shell_output("#{bin}/aws-sso --config /dev/null  2>&1")
  end
end
