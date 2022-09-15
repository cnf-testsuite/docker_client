require "./spec_helper"
require "../docker_client.cr"

describe "DockerClient" do

  it "'installation_found?' should show a git client was located",  do
    (DockerClient.pull("hello-world")[:output].to_s).should contain("Pulling from")
  end

  it "'docker_version_info()' should return the information about the docker installation", tags: ["docker-prereq"]  do
    docker_version = DockerClient.version_info()
    typeof(docker_version).should eq(DockerVersion)
    typeof(docker_version.installed?).should eq(Bool)
  end
end
