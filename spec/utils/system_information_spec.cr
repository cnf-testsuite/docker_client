require "../spec_helper"
require "../../src/utils/system_information.cr"

describe "Docker" do

  it "'docker_global_response()' should return the information about the docker installation", tags: ["docker-prereq"]  do
    (docker_global_response(true)).should contain("docker-init")
  end

  it "'docker_local_response()' should return the information about the docker installation", tags: ["docker-prereq"]  do
    (docker_local_response(true)).should eq("") 
  end

  it "'parse_docker_version()' should return the information about the docker version", tags: ["docker-prereq"]  do
    (parse_docker_version(docker_global_response)).should match(/(([0-9]{1,3}[\.]){1,2}[0-9]{1,3})/)
    (parse_docker_version(docker_local_response)).should contain("")
  end

  it "'docker_version_info()' should return the information about the docker installation", tags: ["docker-prereq"]  do
    docker_version = docker_version_info()
    typeof(docker_version).should eq(DockerVersion)
    typeof(docker_version.installed?).should eq(Bool)
  end
end
