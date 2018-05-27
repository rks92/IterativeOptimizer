# B63MdTMbYtQQ3jNlMwke2NQsKTVWlUfwAHT71hEd
# &perspective=interval&restrict_kind=productivity&interval=hour&restrict_begin=2014-11-01&restrict_end=2014-11-01&

# &perspective=interval&interval=hour&restrict_begin=2018-04-20&restrict_end=2018-04-27

require 'open-uri'
require 'json'

url = "https://www.rescuetime.com/anapi/data?key=B63MdTMbYtQQ3jNlMwke2NQsKTVWlUfwAHT71hEd&format=json
"
response = open(url).read

#puts response.body


my_object = response
puts JSON.pretty_generate(JSON.parse(my_object))