require "yaml"
require_relative "wordplay"

class Bot
  attr_reader :name
  def initialize(options)
    @name = options[:name] || "Unamed Bot"
    begin
      @data = YAML.load(File.read(options[:data_file]))
    rescue
      raise "Can't load data file"
    end
  end

  def greeting
    random_response(:greeting)
  end

  def farewell
    random_response(:farewell)
  end

  def response_to(input)
    prepared_input = preprocess(input.downcase)
    sentence = best_sentence(prepared_input)
    responses = possible_response(sentence)
    responses[rand(responses.length)]
  end
  private

  def preprocess(input)
    perform_substitution input
  end
  def perform_substitution(input)
    @data[:presubs].each do
      |s|
      input.gsub!(s[0],s[1])
    end
    input
  end
  def random_response(key)
    idx = rand(@data[:responses][key].length)
    @data[:responses][key][idx].gsub(/\[name\]/,@name)
  end
  def best_sentence(input)
    hot_words = @data[:responses].keys.select do
      |k|
      k.class == String && k =~ /^\w+$/
    end
    Wordplay.best_sentence(input.sentences,hot_words)
  end

  def possible_response(input)
    responses = []
    @data[:responses].keys.each do
      |pattern|
      next unless pattern.is_a?(String)

      if input.match('\b' + pattern.gsub(/\*/,'') + '\b')
        if pattern.include?('*')
          responses << @data[:responses][pattern].collect do
            |phrase|
            matching_section = input.sub(/^.*#{pattern}\s+/,'')
            phrase.sub('*',Wordplay.switch_pronouns(matching_section))
          end
        else
          responses << @data[:responses][pattern]
        end
      end
    end
    responses << @data[:responses][:default] if responses.empty?
    responses.flatten
  end
end
