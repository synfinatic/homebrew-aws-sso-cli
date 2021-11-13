class AwsSsoCli < Formula
  desc "Securely manage AWS API credentials using AWS SSO"
  homepage "https://github.com/synfinatic/aws-sso-cli"
  url "https://github.com/synfinatic/aws-sso-cli/archive/refs/tags/v1.2.3.tar.gz"
  sha256 "fb27d2b5595b4a5afc3e4a6e9e8d319064f23c938655d9c362c8c4de775a1956"

  depends_on :xcode
  depends_on "go" => [:build]

  def install
    ENV["BREW_INSTALL"] = "1"
    ENV["PROJECT_COMMIT"] = "100c406c492e6a3db7de385fd88811b654c2b0c9"

    system "make"
    bin.install "./dist/aws-sso"
  end

  test do
    assert_match /AWS SSO CLI Version 1.2.3/, shell_output("#{bin}/aws-sso version")
    assert_match /Please specify --sso/, shell_output("#{bin}/aws-sso --config /dev/null  2>&1")
  end
end
