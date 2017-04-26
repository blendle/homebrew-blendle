class Kubecrt < Formula
  desc "Convert Helm charts to Kubernetes resources."
  homepage "https://github.com/blendle/kubecrt"
  url "https://github.com/blendle/kubecrt.git",
    :tag => "v0.3.0",
    :revision => "866332662c1d00ed10adab8b42eefb42f7a17aab"
  head "https://github.com/blendle/kubecrt.git"

  depends_on "go" => :build
  depends_on "glide" => :build

  bottle do
    root_url "https://homebrew-blendle.storage.googleapis.com"
    cellar :any_skip_relocation
    sha256 "df6dcc3e39982b84c53a238f7464e37235952c004226151a59ecd7db308ce6ed" => :sierra
  end

  def install
    ENV["GOPATH"] = buildpath
    ENV["GLIDE_HOME"] = HOMEBREW_CACHE/"glide_home/#{name}"
    dir = buildpath/"src/github.com/blendle/kubecrt"
    dir.install Dir["*"]
    cd dir do
      system "glide", "install"
      system "go", "build", "-o", bin/"kubecrt",
      "-ldflags",
      "-X github.com/blendle/kubecrt/config.version=#{version} -X github.com/blendle/kubecrt/config.gitrev=8663326"
    end
  end

  test do
    system "#{bin}/kubecrt", "--config-docs"
  end
end
