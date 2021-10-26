class CargoInstruments < Formula
  desc "Easily generate Instruments traces for your rust crate"
  homepage "https://github.com/cmyr/cargo-instruments"
  url "https://github.com/cmyr/cargo-instruments/archive/v0.4.4.tar.gz"
  sha256 "e71b29af433f5701483827620866fd6302999d08ddb559578261951da15601cc"
  license "MIT"

  bottle do
    sha256 cellar: :any, arm64_monterey: "cf45a57e7f68b3b18a6c19c5968c02fb9851d4d2c8e6fa448d415de0ed1b198e"
    sha256 cellar: :any, arm64_big_sur:  "4337fa71363264075999d4089113ff7fa3920d6a46ddede5505ed73cd66ae188"
    sha256 cellar: :any, monterey:       "0f6c941cbf4b349d64b3fa2db4db1c004183a8c4361beb03577757b02de75458"
    sha256 cellar: :any, big_sur:        "3185c0685f90123a76d4e1d85c44c537f2c6088fdfd467052e225d15bdaf29a5"
    sha256 cellar: :any, catalina:       "501cf5d9b290167e043f29e5464e1bd8ea49d5b28a591603370e4b47678e1a38"
    sha256 cellar: :any, mojave:         "83f9f2294675328bb4778d55af84e638b07d5620bece3f60cea388c8a484baec"
  end

  depends_on "rust" => :build
  depends_on :macos
  depends_on "openssl@1.1"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    output = shell_output "#{bin}/cargo-instruments instruments", 1
    assert_match output, "could not find `Cargo.toml` in `#{Dir.pwd}` or any parent directory"
  end
end
