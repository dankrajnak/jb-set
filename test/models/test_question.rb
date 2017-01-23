require "test_helper"
require 'minitest/autorun'

class TestQuestion < Minitest::Test
	def setup
		FactoryGirl.define do
			factory :question, class: Question do
				
			end
		end
	end


	def test_create
  
  	end
end