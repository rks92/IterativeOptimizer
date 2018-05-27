require 'open-uri'
require 'json'

namespace :populate_db do
	desc "Populate weekly data from rescue time"
	task :weekly_data => :environment do
		#TODO
	end

	desc "Populate categories"
	task :categories_and_apps => :environment do
		#TODO
		perspective_month =  "&perspective=interval&resolution_time=week&restrict_begin=2018-05-01&restrict_end=2018-05-27"
		perspective_day =  "&perspective=interval&resolution_time=week&restrict_begin=2018-05-01&restrict_end=2018-05-27"

		url = "https://www.rescuetime.com/anapi/data?key=B63MdTMbYtQQ3jNlMwke2NQsKTVWlUfwAHT71hEd&format=json
		"
		response = open(url + perspective_month).read

		res = JSON.parse(response)
		#puts JSON.pretty_generate(res)



		headers_hash = Hash.new
		res["row_headers"].each_with_index do |header, index|
			headers_hash[header] = index
		end

		category_hash = Hash.new
		app_hash = Hash.new

		res["rows"].each do |cw|
			if category_hash[cw[4]].nil?
				category_hash[cw[4]] = cw[5]
			end

			if app_hash[cw[3]].nil?
				app_hash[cw[3]] = cw[5]
			end
		end

		category_hash.each do |k, v|
			puts k + ": " + v.to_s
			Category.create(name: k, productivity_score: v)
		end

		app_hash.each do |k, v|
			puts k + ": " + v.to_s
			App.create(name: k, productivity_score: v)
		end
	end
end