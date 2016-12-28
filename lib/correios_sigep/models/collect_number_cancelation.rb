module CorreiosSigep
  module Models
    class CollectNumberCancelation
      attr_accessor :collect_number, :type

      def initialize(options={})
        @collect_number = options[:collect_number]
        @type           = options[:type]
      end

      def to_xml
        builder = Nokogiri::XML::Builder.new do |xml|
          xml.root {
            xml.tipo(@type)
            xml.numeroPedido(@collect_number)
          }
        end
        builder.to_xml
      end
    end
  end
end
