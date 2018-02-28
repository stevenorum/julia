import GLM
#import DataFrames
import CSV

filename = "jfk_2017.csv"
raceinfo = CSV.read(filename)
println(size(raceinfo))
println(names(raceinfo))
model = GLM.glm(@GLM.formula(time ~ age + split_1_startAT + split_2_weverton1 + split_4_antietam), raceinfo, GLM.Normal(), GLM.IdentityLink())
println(model)
results2016 = CSV.read("jfk_2016.csv")
predictions2016 = GLM.predict(model, results2016)
times2016 = @view results2016[1:749,[:name,:time]]
tp2016 = hcat(times2016,predictions2016)
tp2016[:accuracy_abs] = map((x,y) -> abs((x/y)-1), tp2016[:time], tp2016[:x1])
tp2016[:accuracy_abs_ms] = map((x,y) -> abs(x-y), tp2016[:time], tp2016[:x1])
tp2016[:accuracy_abs_minutes] = map((x,y) -> abs(x-y)/60000, tp2016[:time], tp2016[:x1])
tp2016[:accuracy] = map((x,y) -> (y/x)-1, tp2016[:time], tp2016[:x1])
tp2016[:accuracy_minutes] = map((x,y) -> (y-x)/60000, tp2016[:time], tp2016[:x1])
avg_accuracy = mean(tp2016[:accuracy_minutes])
std_accuracy = std(tp2016[:accuracy_minutes])
avg_abs_accuracy = mean(tp2016[:accuracy_abs_minutes])
std_abs_accuracy = std(tp2016[:accuracy_abs_minutes])
println("Mean accuracy (minutes):  $(@sprintf("%.2f", avg_accuracy))")
println("StDev accuracy (minutes): $(@sprintf("%.2f", std_accuracy))")
println("Mean absolute accuracy (minutes):  $(@sprintf("%.2f", avg_abs_accuracy))")
println("StDev absolute accuracy (minutes): $(@sprintf("%.2f", std_abs_accuracy))")
