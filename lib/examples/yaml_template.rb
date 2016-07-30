require 'yaml'
require 'erb'

module Examples
  class YamlTemplate
    def self.compile(template_path, dest_path, data)
      YamlTemplate.new(template_path, dest_path, data).compile
    end

    def initialize(tp, dp, data = { })
      @template_path = tp
      @dest_path = dp
      @data = data
    end

    def compile
      written = 0

      if File.exist?(@template_path)
        tp_contents = File.read(@template_path)

        unless tp_contents.empty?
          tp_contents = ERB.new(tp_contents).result(binding)
          parsed_yml = YAML.load(tp_contents)

          unless parsed_yml.nil? || parsed_yml == false || parsed_yml.empty?
            dumped_yml = YAML.dump(parsed_yml)

            FileUtils.mkpath(File.dirname(@dest_path))
            written = File.write(@dest_path, dumped_yml)
          else
            raise 'Template file parsing failed'
          end
        else
          raise 'Template file empty'
        end
      else
        raise 'Template file %s not found' % template_path
      end

      written
    end

    def hostname
      `hostname`.strip
    end

    def owner
      @data[:owner]
    end

    def locations
      { :cebu => 'Cebu City',
        :manila => 'Metro Manila',
        :bohol => 'Tagbilaran',
        :siargao => 'General Luna',
        :leyte => 'Ormoc',
        :germany => 'Berlin',
        :mexico => 'Mexico City',
        :usa => 'Washington',
        :finland => 'Helsinki'
      }
    end

    def location_code
      @data[:location_code]
    end
  end
end
