# frozen_string_literal: true

require "spec_helper"

describe(BridgetownHaml) do
  let(:overrides) { {} }
  let(:config) do
    Bridgetown.configuration(Bridgetown::Utils.deep_merge_hashes({
      "full_rebuild" => true,
      "root_dir"     => root_dir,
      "source"       => source_dir,
      "destination"  => dest_dir,
    }, overrides))
  end
  let(:metadata_overrides) { {} }
  let(:metadata_defaults) do
    {
      "name" => "My Awesome Site",
      "author" => {
        "name" => "Ada Lovejoy",
      }
    }
  end
  let(:site) { Bridgetown::Site.new(config) }
  let(:contents) { File.read(dest_dir("index.html")) }
  before(:each) do
    metadata = metadata_defaults.merge(metadata_overrides).to_yaml.sub("---\n", "")
    File.write(source_dir("_data/site_metadata.yml"), metadata)
    site.process
    FileUtils.rm(source_dir("_data/site_metadata.yml"))
  end

  it "outputs Haml template content" do
    expect(contents).to match "<p>This example shows you how a basic Haml file looks.</p>"
    expect(contents).to match "<title>I'm a Haml title!</title>"
    expect(contents).to match "<h1>Markup examples</h1>"
    expect(contents).to match "<h2>TITLE: I'm a Haml title!</h2>"
    expect(contents).to match "<footer>one, two, and three</footer>"
    expect(contents).to match "<li>Nifty!</li>"
  end
end
