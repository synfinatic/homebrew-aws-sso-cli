class AwsSsoCli < Formula
  desc "Securely manage AWS API credentials using AWS SSO"
  homepage "https://github.com/synfinatic/aws-sso-cli"
  url "https://github.com/synfinatic/aws-sso-cli/archive/refs/tags/v1.7.4.tar.gz"
  sha256 "6c017bb23dec1e18c71ec69b9c3c7be6776755dddaef87fc37cf4c0acf65da58"

  depends_on :xcode
  depends_on "go" => [:build, "1.17.0"]

  def install
    ENV["BREW_INSTALL"] = "1"
    ENV["PROJECT_COMMIT"] = "465eaafbcb29ea217e587a592ec5692937a3f176"

    system "make"
    bin.install "./dist/aws-sso"
  end

  test do
    assert_match /AWS SSO CLI Version 1.7.4/, shell_output("#{bin}/aws-sso version")
    assert_match /Please specify --sso/, shell_output("#{bin}/aws-sso --config /dev/null  2>&1")
  end
end
