# encoding: UTF-8

require 'saddle/endpoint'



module Facebook
  module Endpoints

    class User < Saddle::TraversalEndpoint

      ABSOLUTE_PATH = ''

      def me(opts = {})
        by_id('me', opts)
      end

      def by_id(_id, opts = {})
        get(_id, opts_to_params(opts), opts)
      end


      private

      # Put useful params out of the opts
      def opts_to_params(opts)
        params = {}
        params['fields'] = opts[:fields].map(&:to_s).join(',') if opts[:fields]
        params
      end

    end

  end
end
