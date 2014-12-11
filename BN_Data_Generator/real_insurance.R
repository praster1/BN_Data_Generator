# Written by Jae-seong Yoo 20141101

real_insurance = function(n)
{
	data(insurance)

	if (n >= 20000)
	{
		data = insurance[sample(c(1:20000), n, rep=T),]
	} else {
		data = insurance[sample(c(1:20000), n),]
	}

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
	  
	result = list(	data = data, res = res)
						
	return(res)
}