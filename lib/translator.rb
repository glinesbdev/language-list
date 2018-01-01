class Translator
  def initialize
    EasyTranslate.api_key = ENV['GOOGLE_TRANSLATE_API_KEY']
  end

  def translate(to, from, *args)
    EasyTranslate.translate(args, from: from.downcase.to_sym, to: to.downcase.to_sym)
  end

  def detect(*args)
    results = []
    item = {}

    EasyTranslate.detect(args, confidence: true).each do |lang|
      item[:language] = EasyTranslate::LANGUAGES[lang[:language]].capitalize
      item[:reliability] = (lang[:confidence] * 100).round(2).to_s + '%'
      results << item
      item = {}
    end

    results
  end
end