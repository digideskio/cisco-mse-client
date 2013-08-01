# encoding: UTF-8

require 'saddle/endpoint'



module Facebook
  module Endpoints

    class FQL < Saddle::TraversalEndpoint

      def query(q, opts = {})
        get(nil, {'q' => q}, opts)['data']
      end

    end

  end
end
