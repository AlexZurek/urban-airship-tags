# frozen_string_literal: true

require 'urbanairship'
require 'set'

# Setup environment variables
unless system("/bin/bash -c 'source .env'")
  puts <<-ERROR

  Problem sourcing the `.env` file.

  Ensure that the file exists and is formatted properly. See `.env.sample` for details.

  ERROR

  exit!
end

# Credentials for Urban Airship project
KEY = ENV['UA_KEY']
SECRET = ENV['UA_SECRET']

# Setup Urban Airship client
UA = Urbanairship
airship = UA::Client.new(key: KEY, secret: SECRET)

# Retrieve channel list
channel_list = UA::ChannelList.new(client: airship)

# Get unique tags for tag groups
tags_by_group = {}
channel_list.each do |channel|
  next if channel["tag_groups"].empty?

  channel["tag_groups"].each do |key, values|
    tags_by_group[key] = Set.new if tags_by_group[key].nil?

    values.each do |v|
      tags_by_group[key] << v
    end
  end
end

# Generate sorted output
tags_by_group.sort.each do |k, values|
  puts "#{k}:"
  values.to_a.sort.each do |v|
    puts "\t- #{v}"
  end
  puts
end
