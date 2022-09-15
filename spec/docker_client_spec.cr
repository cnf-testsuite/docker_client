require "./spec_helper"
require "../docker_client.cr"

describe "DockerClient" do

  it "'installation_found?' should show a git client was located",  do
    (DockerClient.pull("hello-world")[:output].to_s).should contain("Pulling from")
  end
end
