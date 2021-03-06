require 'spec_helper'

module CorreiosSigep
  module Builders
    module XML
      describe Request do
        describe '.build_xml' do
          let(:request) { double(:request, to_xml: '<root><test></root>') }
          context 'when do not override anything' do
            it 'builds a Authentication XML with Configuration parameters' do
              expected_response = [
                '<codAdministrativo>08082650</codAdministrativo><test/>'
              ].join + "\n"
              expect(described_class.build_xml request).to eq expected_response
            end
          end

          context 'when override the administrative fields' do
            it 'builds a Authentication XML with the override parameter' do
              administrative_fields = Models::AdministrativeFields.new(administrative_code: 'adm123',
                                                                       card: 'card123',
                                                                       service_code: 'ser123')
              expected_response = [
                '<codAdministrativo>adm123</codAdministrativo><test/>'
              ].join + "\n"
              expect(described_class.build_xml request, administrative: administrative_fields).to eq expected_response
            end
          end

        end
      end
    end
  end
end
