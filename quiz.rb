require 'timeout'
require "csv"
file = CSV.parse(File.read("problems.csv"))
def ask_question(question,answer,timer)
    puts question
    Timeout::timeout(timer)do
    user_ans =gets.chomp
    puts "\n    times up!   "
    return user_ans === answer
end
rescue Timeout::Error
    return false
end
timer = 5
count = 0
for i in 0..file.length-1 do
    correct = ask_question(file[i][0],file[i][1],timer)
    count += 1 if correct
end
puts "TOTAL NUMBER OF QUESTIONS: #{file.length} " 
puts "TOTAL NUMBER OF correct answers: #{count} "
puts " PRESS 1 IF YOU WANT CHANGE THE FILENAME "
flag = gets.chomp.to_i
if flag == 1
    puts " NOW, Enter the File Name: "
    file = gets
    File.rename("problems.csv", file + ".csv")
end
