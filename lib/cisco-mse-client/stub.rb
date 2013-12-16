# encoding: UTF-8

require 'cisco-mse-client/endpoints/location'

# This allows us to stub out live calls when testing from calling projects

module CiscoMSE
  module Stub

    # Setup stubbing for all endpoints
    def stub!
      CiscoMSE::Endpoints::Location.any_instance.stub(:clients).and_return( Stub::Data::Location::CLIENTS )
    end

    # Test data for stubs to return
    module Data
      module Location
        CLIENTS = {
          'macAddress' => '00:00:00:00:00:00',
          'currentlyTracked' => true,
          'confidenceFactor' => 200.0,
          'band' => 'UNKNOWN',
          'isGuestUser' => false,
          'dot11Status' => 'PROBING',
          'MapInfo' => {
            'mapHierarchyString' => 'Campus>Building>1st Floor',
            'floorRefId' => 1234567890,
            'Dimension' => {
              'length' => 228.1,
              'width' => 319.4,
              'height' => 14.0,
              'offsetX' => 0.0,
              'offsetY' => 0.0,
              'unit' => 'FEET',
            },
            'Image' => {
              'imageName' => 'domain_0_1381271699478.jpg',
            },
          },
          'MapCoordinate' =>{
            'x' => 106.71,
            'y' => 167.93,
            'unit' => 'FEET',
          },
          'Statistics' => {
            'currentServerTime' => '2013-12-16T18:25:00.752-0500',
            'firstLocatedTime' => '2013-12-13T10:50:01.581-0500',
            'lastLocatedTime' => '2013-12-16T18:24:00.050-0500',
          }
        }
      end
    end

  end
end
