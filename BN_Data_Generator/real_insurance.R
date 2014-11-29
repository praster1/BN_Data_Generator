require(bnlearn)
data(insurance)
data = insurance[sample(c(1:20000), n),]
res = empty.graph(names(insurance))
modelstring(res) = paste("[Age][Mileage][SocioEcon|Age][GoodStudent|Age:SocioEcon]",
  "[RiskAversion|Age:SocioEcon][OtherCar|SocioEcon][VehicleYear|SocioEcon:RiskAversion]",
  "[MakeModel|SocioEcon:RiskAversion][SeniorTrain|Age:RiskAversion]",
  "[HomeBase|SocioEcon:RiskAversion][AntiTheft|SocioEcon:RiskAversion]",
  "[RuggedAuto|VehicleYear:MakeModel][Antilock|VehicleYear:MakeModel]",
  "[DrivingSkill|Age:SeniorTrain][CarValue|VehicleYear:MakeModel:Mileage]",
  "[Airbag|VehicleYear:MakeModel][DrivQuality|RiskAversion:DrivingSkill]",
  "[Theft|CarValue:HomeBase:AntiTheft][Cushioning|RuggedAuto:Airbag]",
  "[DrivHist|RiskAversion:DrivingSkill][Accident|DrivQuality:Mileage:Antilock]",
  "[ThisCarDam|RuggedAuto:Accident][OtherCarCost|RuggedAuto:Accident]",
  "[MedCost|Age:Accident:Cushioning][ILiCost|Accident]",
  "[ThisCarCost|ThisCarDam:Theft:CarValue][PropCost|ThisCarCost:OtherCarCost]",
  sep = "")

nodes = dim(data)[2]
arcs_mat = matrix(0, nodes, nodes)

arc_name = names(data)
arcs_order_mat = cbind(arc_name, c(1:length(arc_name)))
arcs = cbind(match(res$arc[,1], arcs_order_mat), match(res$arc[,2], arcs_order_mat))


if (length(arcs) > 0)
{
	for (i in 1:dim(arcs)[1])
	{
		from = as.numeric(arcs[i,1])
		to = as.numeric(arcs[i,2])
		arcs_mat[from, to] = arcs_mat[from, to] + 1
	}
}


arcs = arcs_mat