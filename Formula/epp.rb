require "language/go"

class Epp < Formula
  desc "Small templating engine that allows the use of environmental variables."
  homepage "https://github.com/blendle/epp"
  url "https://github.com/blendle/epp.git",
    :tag => "v1.1.1",
    :revision => "225bdbacaf52f2d42f2ceaefded96a8ddd08f8fe"
  head "https://github.com/blendle/epp.git"

  depends_on "go" => :build

  go_resource "github.com/blendle/epp" do
    url "https://github.com/blendle/epp.git",
        :revision => "225bdbacaf52f2d42f2ceaefded96a8ddd08f8fe"
  end

  go_resource "github.com/flosch/pongo2" do
    url "https://github.com/flosch/pongo2.git",
        :revision => "1d0f0d3af150c4a65dfd424d742f7374819e7d29"
  end

  go_resource "github.com/juju/errors" do
    url "https://github.com/juju/errors.git",
        :revision => "6f54ff6318409d31ff16261533ce2c8381a4fd5d"
  end

  devel do
    url "https://github.com/blendle/epp.git",
      :tag => "v2.0.0-rc2",
      :revision => "f5da9002496df249035fa4823f7ddae7131658c5"

    go_resource "github.com/Masterminds/semver" do
      url "https://github.com/Masterminds/semver.git",
          :revision => "517734cc7d6470c0d07130e40fd40bdeb9bcd3fd"
    end

    go_resource "github.com/Masterminds/sprig" do
      url "https://github.com/Masterminds/sprig.git",
          :revision => "4c164950cd0a8d3724ddb78982e2c56dc7f47112"
    end

    go_resource "github.com/aokoli/goutils" do
      url "https://github.com/aokoli/goutils.git",
          :revision => "3391d3790d23d03408670993e957e8f408993c34"
    end

    go_resource "github.com/huandu/xstrings" do
      url "https://github.com/huandu/xstrings.git",
          :revision => "d6590c0c31d16526217fa60fbd2067f7afcd78c5"
    end

    go_resource "github.com/imdario/mergo" do
      url "https://github.com/imdario/mergo.git",
          :revision => "e3000cb3d28c72b837601cac94debd91032d19fe"
    end

    go_resource "github.com/satori/go.uuid" do
      url "https://github.com/satori/go.uuid.git",
          :revision => "5bf94b69c6b68ee1b541973bb8e1144db23a194b"
    end

    go_resource "golang.org/x/crypto" do
      url "https://go.googlesource.com/crypto.git",
          :revision => "7d9177d70076375b9a59c8fde23d52d9c4a7ecd5"
    end
  end

  def install
    ENV["GOPATH"] = buildpath
    Language::Go.stage_deps(resources, buildpath/"src")

    system "make", "build"
    bin.install "bin/epp"
  end

  test do
    system "#{bin}/epp", "-version"
  end
end
