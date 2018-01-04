import GLM
import DataFrames

data = DataFrames.DataFrame(X=[1,2,3], Y=[2,4,7])
println(data)

OLS = GLM.glm(GLM.@formula(Y ~ X), data, GLM.Normal(), GLM.IdentityLink())
println(OLS)
println(GLM.stderr(OLS))
println(GLM.predict(OLS))
