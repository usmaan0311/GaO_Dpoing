using Plots, DataFrames, DelimitedFiles, LsqFit, Glob, Pipe, Query

df = @pipe Glob.glob("*.txt")[1] |> readdlm(_,',',skipstart=2) |> DataFrame(_,:auto)
df |> @select(:x1, :x2) |> collect 

function α(data,flag="s")
    t=798e-7
    λ=data[:,1]
    En=1240*data[:,1].^-1
    abn=log(10)*data[:,2]/t
    if flag=="l"
        return plot(λ,abn)
    else
        return plot(En,abn)
    end
    

end
p=α(df,"l") 
