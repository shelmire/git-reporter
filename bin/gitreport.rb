#!/usr/bin/env ruby

require 'date'

num_weeks = ARGV[0]

today = Date.today

all_logs = `git log --after="#{num_weeks} weeks ago" --before="0 weeks ago" | grep Author | sed 's!Author:!!g' | sort | uniq -c`

authors = {}
all_logs.each_line do |l|
  split_line = l.gsub(/^\s+/, '').split("<")[0].split("  ")
  authors[split_line[1].gsub(/\s+$/, '')] = [split_line[0]]
end
#puts authors.inspect

weeks = ["Name", "Total"]
num_weeks.times do |t|
  weeks << (today - (7*t)).strftime("%m/%d/%Y")
  authors.keys.each do |a|
    this_weeks_log = `git log --after="#{t+1} weeks ago" --before="#{t} weeks ago" --author="#{a}" | grep Author`.lines.count
    authors[a] << this_weeks_log
  end
end

puts weeks.join("\t")
authors.each do |k,v|
  puts k + "\t" + v.join("\t")
end