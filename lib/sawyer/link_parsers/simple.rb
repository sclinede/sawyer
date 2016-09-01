module Sawyer
  module LinkParsers

    class Simple

      LINK_REGEX = /_?url$/.freeze
      URL = 'url'.freeze
      SELF = 'self'.freeze
      EMPTY = ''.freeze

      # Public: Parses simple *_url style links on resources
      #
      # data   - Hash of resource data
      #
      # Returns a Hash of data with separate links Hash
      def parse(data)

        links = {}
        data.keys.each do |key|
          key_str = key.to_s.freeze
          next unless key_str[LINK_REGEX]
          rel_name = key_str == URL ? SELF : key_str.gsub(LINK_REGEX, EMPTY).freeze
          links[rel_name.to_sym] = data[key]
        end

        return data, links
      end

    end

  end
end
