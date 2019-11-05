require 'hayden/probe/version'

Dir[File.expand_path('../probe/*.rb', __FILE__)].map do |path|
  require path
end

Dir[File.expand_path('../probe/errors/*.rb', __FILE__)].map do |path|
  require path
end

Dir[File.expand_path('../probe/moves/*.rb', __FILE__)].map do |path|
  require path
end

module Hayden
  module Probe
    # Your code goes here...
  end
end
