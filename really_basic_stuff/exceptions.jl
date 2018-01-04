a=Int64[]

function example!(a, x)
    println("example! beginning")
    try
        push!(a,x)
        println("example! did not encounter an error")
    catch err
        println("example! encountered an error")
        showerror(STDOUT, err, backtrace());println()
    finally
        println("Printing this regardless of whether or not there was an error.")
    end
    println("example! ending")
end

example!(a,1)
example!(a,1.1)
