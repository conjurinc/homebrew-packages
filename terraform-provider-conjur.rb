# This file was generated by GoReleaser. DO NOT EDIT.
class TerraformProviderConjur < Formula
  desc "Terraform provider for CyberArk Conjur"
  homepage "https://github.com/cyberark/terraform-provider-conjur"
  version "0.4.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/cyberark/terraform-provider-conjur/releases/download/v0.4.0/terraform-provider-conjur-0.4.0-darwin-amd64.tar.gz"
    sha256 "616327d3c4c8ae15918f081f7ef7a4862b2d72070b4a7a39257854fbc5b97cf8"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/cyberark/terraform-provider-conjur/releases/download/v0.4.0/terraform-provider-conjur-0.4.0-linux-amd64.tar.gz"
      sha256 "9489f6315fcbb4e56e539dd85a129b315ecf9acce840cf904171c7cba4aa4636"
    end
  end
  
  depends_on "terraform"

  def install
    bin.install "terraform-provider-conjur_v0.4.0"
  end

  def caveats; <<~EOS
    After installation, you must symlink the provider into Terraform's plugins directory.
    Symlinking is necessary because Homebrew is sandboxed and cannot write to your home directory.
    
    # Make the plugins directory if not present
    mkdir -p ~/.terraform.d/plugins/
    
    # Remove any old unversioned plugins (if applicable)
    rm -f  ~/.terraform.d/plugins/terraform-provider-conjur
    
    # Symlink the provider to your home dir. If Homebrew is installing somewhere other than /usr/local/Cellar, update the path as well.
    ln -sf /usr/local/Cellar/terraform-provider-conjur/0.4.0/bin/terraform-provider-conjur_v0.4.0 ~/.terraform.d/plugins/terraform-provider-conjur_v0.4.0
  EOS
  end

  test do
    # Running bin directly gives error, exit code 1
    system "#{bin}/terraform-provider-conjur_v0.4.0", "-h"
  end
end
