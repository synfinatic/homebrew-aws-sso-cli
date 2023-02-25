class AwsSsoCli < Formula
  desc "Securely manage AWS API credentials using AWS SSO"
  homepage "https://github.com/synfinatic/aws-sso-cli"
  url "__URL__"
  sha256 "__SHA256__"

  depends_on "go" => [:build, :test]
  depends_on :xcode

  def install
    ENV["BREW_INSTALL"] = "1"
    ENV["PROJECT_COMMIT"] = "__COMMIT__"

    system "make"
    bin.install "./dist/aws-sso"
  end

  test do
    assert_match "AWS SSO CLI Version __VERSION__", shell_output("#{bin}/aws-sso version")
    assert_match "No AWS SSO providers have been configured.",
        shell_output("#{bin}/aws-sso --config /dev/null  2>&1", 1)
  end
end
