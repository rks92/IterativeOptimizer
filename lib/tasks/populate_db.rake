require 'open-uri'
require 'json'

namespace :populate_db do
	desc "Create sample user"
	task :create_sample_user => :environment do 
		User.create(handle: "theplatypus")
	end

	desc "Populate RescueTime data"
	task :rt_data => :environment do
		perspective_month =  "&perspective=interval&resolution_time=week&restrict_begin=2018-01-01&restrict_end=2018-05-27"
		perspective_day =  "&perspective=interval&resolution_time=week&restrict_begin=2018-01-01&restrict_end=2018-05-27"

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
		app_category_hash = Hash.new
		weeks = Array.new

		res["rows"].each do |cw|
			if category_hash[cw[4]].nil?
				category_hash[cw[4]] = cw[5]
			end

			if app_hash[cw[3]].nil?
				app_hash[cw[3]] = cw[5]
				app_category_hash[cw[3]] = cw[4]
			end

			temp_h = Hash.new
			headers_hash.each do |k, v|
				temp_h[k] = cw[v]
			end
			puts temp_h
			weeks.push(temp_h)
		end

		category_hash.each do |k, v|
			puts k + ": " + v.to_s
			Category.create(name: k, productivity_score: v)
		end

		app_hash.each do |k, v|
			puts k + ": " + v.to_s
			App.create(name: k, productivity_score: v, category_id: Category.find_by(name: app_category_hash[k]).id)
		end

		weeks.each_with_index do |w, i|
			date = Date.parse(w["Date"])
			cat = Category.find_by(name: w["Category"])
			app = App.find_by(name: w["Activity"])

			wg = WeeklyGoal.new(
				begin_date: date, 
				end_date: (date + 6.days),
				fault_tolerance: 0.1,
				momentum: 1,
				category_id: cat.id,
				app_id: app.id,
				user_id: 1,
				actual_time_min: (w["Time Spent (seconds)"]/60.0).ceil)
			wg.save!
		end
	end
end