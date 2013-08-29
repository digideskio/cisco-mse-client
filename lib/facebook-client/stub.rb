# encoding: UTF-8

require 'facebook-client/endpoints/fql'
require 'facebook-client/endpoints/user'

# This allows us to stub out live calls when testing from calling projects

module Facebook
  module Stub

    # Setup stubbing for all endpoints
    def stub!
      Facebook::Endpoints::FQL.any_instance.stub(:query).and_return( Stub::Data::TEST_FQL_RESPONSE )

      Facebook::Endpoints::User.any_instance.stub(:me).and_return( Stub::Data::TEST_USER )
      Facebook::Endpoints::User.any_instance.stub(:by_id).and_return( Stub::Data::TEST_USER )
    end

    # Test data for stubs to return
    module Data
      LAST_NAMES = %w{
        Smith
        Johnson
        Williams
        Jones
        Brown
        Davis
        Miller
        Wilson
        Moore
        Taylor
        Anderson
        Thomas
        Jackson
        White
        Harris
        Martin
        Thompson
        Garcia
        Martinez
      }

      FIRST_NAMES = %w{
        Abigail
        Aiden
        Alexander
        Ava
        Elizabeth
        Emily
        Emma
        Ethan
        Isabella
        Jacob
        Jayden
        Liam
        Madison
        Mason
        Mia
        Michael
        Noah
        Olivia
        Sophia
        William
      }

      TEST_FQL_RESPONSE = [{}.freeze].freeze

      TEST_USER = {
        'id' => "1",
        'name' => "Squirrely BooBoo",
        'first_name' => "Squirrely",
        'last_name' => "BooBoo",
        'link' => "https://www.facebook.com/mLewisLogic",
        'username' => "mLewisLogic",
        'birthday' => "12/12/1923",
        'hometown' => {
          'id'   => "109748972377870",
          'name' => "Syracuse, New York",
        },
        'location' => {
          'id'   => "114952118516947",
          'name' => "San Francisco, California",
        },
        'quotes' =>
          "The Church says: the body is a sin.\n" +
          "Science says: the body is a machine.\n" +
          "Advertising says: The body is a business.\n" +
          "The Body says: I am a fiesta.\n" +
          " ― Eduardo Hughes Galeano",
        'sports' => [
          {
            'id'   => "108167272538953",
            'name' => "Table tennis"
          },
          {
            'id'   => "107496599279538",
            'name' => "Snowboarding",
          },
        ],
        'education' => [
          {
            'school' => {
              'id'   => "110481998980842",
              'name' => "Christian Brothers Academy",
            },
            'year' => {
              'id'   => "194603703904595",
              'name' => "2003",
            },
            'type' => 'High School',
          },
          {
            'school' => {
              'id'   => "12355161929",
              'name' => "Rochester Institute of Technology",
            },
            'year' => {
              'id'   => "141778012509913",
              'name' => "2008",
            },
            'concentration' => [
              {
                'id'   => "112377098773944",
                'name' => "Computer Engineering",
              },
              {
                'id'   => "108384569189012",
                'name' => "Sociology",
              }
            ],
            'type' => "College",
          },
          {
            'school' => {
              'id' => "5755052206",
              'name' => "University of Sydney",
            },
            'year' => {
              'id' => "137616982934053",
              'name' => "2006",
            },
            'concentration' => [
              {
                'id' => "108384569189012",
                'name' => "Sociology",
              }
            ],
            'type' => "College",
          },
          {
            'school' => {
              'id' => "12355161929",
              'name' => "Rochester Institute of Technology",
            },
            'degree' => {
              'id' => "109903862418964",
              'name' => "Master of Science",
            },
            'year' => {
              'id' => "141778012509913",
              'name' => "2008",
            },
            'concentration' => [
              {
                'id' => "112377098773944",
                'name' => "Computer Engineering",
              }
            ],
            'type' => "Graduate School",
          }
        ],
        'gender' => "male",
        'email' => "squirrely.booboo@gmail.com",
        'timezone' => -7,
        'locale' => "en_US",
        'languages' => [
          {
            'id' => "106059522759137",
            'name' => "English",
          }
        ],
        'verified' => true,
        'updated_time' => "2013-06-15T04:06:53+0000",
        'devices' => [
          {
            "os" => "Android"
          }
        ],
        # Generate an array of names and IDs.
        'friends' => 100.times.map do
          {
            "name" => "#{FIRST_NAMES.sample} #{LAST_NAMES.sample}",
            "id" => (rand * 10000).to_i,
          }
        end,
        # Generate an array of random likes.
        'likes' => 10.times.map do
          {
            "name" => "#{FIRST_NAMES.sample} #{LAST_NAMES.sample}",
            "id" => (rand * 10000).to_i,
            "category" => %w{Website Product Person Celebrity}.sample,
            "updated_time" => rand((Time.now - 1.year)..Time.now).to_s,
          }
        end,
      }.freeze
    end

  end
end
