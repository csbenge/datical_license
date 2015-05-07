module LicensesHelper

  
  LICENSETYPE = {'Admin' => 'Admin', 'Deployer' => 'Deployer', 'Forecaster' => 'Forecaster'}

  LICENSEJSONEXAMPLE = '{
	  "consumerAmount":1,
	  "consumerType":"User",
	  "issuer":"CN=Datical Inc.",
	  "subject":"Datical DB Deployer",
	  "holder":"CN=Bank of Americam eComm,O=BAC eComm",
	  "notAfter":"2016-01-15T23:59:59-0500",
	  "info":"Datical DB Customer License"
	}'

	LICENSEJSON = '{
	  "consumerAmount":XconsumerAmountX,
	  "consumerType":"XconsumerTypeX",
	  "issuer":"CN=XissuerX",
	  "subject":"Datical DB XconsumerTypeX",
	  "holder":"CN=XcompanyNameX,O=XcompanyStageX",
	  "notAfter":"XnotAfterXT23:59:59-0500",
	  "info":"Datical DB XcompanyStageX License"
	}'

	def bin_to_hex(s)
    #s.each_byte.map { |b| b.to_s(16).rjust(2,'0') }.join
	end

	def getYYYYMMDD(date)
		date.strftime("%Y-%m-%d")
	end

end
