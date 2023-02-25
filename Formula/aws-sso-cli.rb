class AwsSsoCli < Formula
  desc "Securely manage AWS API credentials using AWS SSO"
  homepage "https://github.com/synfinatic/aws-sso-cli"
  url "https://github.com/synfinatic/aws-sso-cli/archive/refs/tags/v1.9.9.tar.gz"
  sha256 "ef3592a2fdf9d1812059dcbc7b397a110cb4de523f2ca8dec57a9d7a6bad54ef"

  depends_on "go" => [:build, :test]
  depends_on :xcode

  def install
    ENV["BREW_INSTALL"] = "1"
    ENV["PROJECT_COMMIT"] = "2e15b09ca75285bfe7d8c8804a6f4eb9d7579482"

    system "make"
    bin.install "./dist/aws-sso"
  end

  test do
    assert_match "AWS SSO CLI Version 1.9.9", shell_output("#{bin}/aws-sso version")
    assert_match "No AWS SSO providers have been configured.",
        shell_output("#{bin}/aws-sso --config /dev/null 2>&1", 1)
  end
end
