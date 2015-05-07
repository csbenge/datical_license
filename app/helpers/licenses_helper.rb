module LicensesHelper
  
  LICENSETYPE = {'Admin' => 'Admin', 'Deployer' => 'Deployer', 'Forecaster' => 'Forecaster'}

  LICENSEJSON = '{
	  "consumerAmount":1,
	  "consumerType":"User",
	  "issuer":"CN=Datical Inc.",
	  "subject":"Datical DB Deployer",
	  "holder":"CN=Bank of Americam eComm,O=BAC eComm",
	  "notAfter":"2016-01-15T23:59:59-0500",
	  "info":"Datical DB Customer License"
	}'

	def getYYYYMMDD(date)
		date.strftime("%Y-%m-%d")
	end

end
