require_relative 'v1/client'
require_relative 'v1/services/movie'
require_relative 'v1/services/quote'

module LotrSDK
  def self.version(version_number = 'v1')
    case version_number
    when 'v1'
      LotrSDK::V1
    else
      raise 'Unsupported SDK version'
    end
  end
end