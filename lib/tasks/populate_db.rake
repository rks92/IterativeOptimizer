require 'open-uri'
require 'json'

namespace :populate_db do
	desc "Populate weekly data from rescue time"
	task :weekly_data => :environment do
		#TODO
	end

	desc "Populate categories"
	task :categories => :environment do
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

		res["rows"].each do |cw|
			if category_hash[cw[4]].nil?
				category_hash[cw[4]] = Array.new
			end

			temp_h = Hash.new
			headers_hash.each do |k, v|
				temp_h[k] = cw[v]
			end

			category_hash[cw[4]].push(temp_h)
		end

		category_hash.each do |k, c|
			puts k + ": " + c[0]["Productivity"].to_s
			Category.create(name: k, productivity_score: c[0]["Productivity"])
		end
	end
end