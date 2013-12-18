# encoding: UTF-8

require 'saddle/endpoint'



module CiscoMSE
  module Endpoints

    class Location < Saddle::TraversalEndpoint

      def clients(_id, opts = {})
        begin
          get("clients/#{_id}", opts)
        rescue CiscoMSE::NotFoundError => e
          nil
        end
      end

    end

  end
end
