function sphere_vol(r::Float64)
    # julia allows Unicode names (in UTF-8 encoding)
    # so either "pi" or the symbol π can be used
    return 4/3*pi*r^3
end


vol = sphere_vol(3.0)

# @printf allows number formatting but does not automatically append the \n to statements, see below

@printf "volume = %0.3f\n" vol
println("volume = ", vol)
