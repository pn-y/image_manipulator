module ImageManipulationService
  class << self
    def manipulate(image, manipulations = [])
      image =  MiniMagick::Image.open(image)
      image.combine_options do |i|
        manipulations.each do |(method, params)|
          params.present? ? i.public_send(method.to_sym, params) : i.public_send(method.to_sym)
        end
      end
      image.write('output')
      image.path
    end
  end
end
