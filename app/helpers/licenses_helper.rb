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
	  "issuer":"XissuerX",
	  "subject":"Datical DB XconsumerTypeX",
	  "holder":"CN=XcompanyNameX,O=XcompanyStageX",
	  "notAfter":"XnotAfterXT23:59:59-0500",
	  "info":"Datical DB XcompanyStageX License"
	}'

	def bin_to_hex(s)
    s.each_byte.map { |b| b.to_s(16).rjust(2,'0') }.join
	end

	def getYYYYMMDD(date)
		date.strftime("%Y-%m-%d")
	end

	def getNotAfterDays(date)
		now = DateTime.now
		daysRemaining = ((date - now)/(60*60*24)).round
		 if daysRemaining <= 0
      "<span class='label radius alert'><b>#{daysRemaining}</b></span>"
    elsif daysRemaining < 7
    	"<span class='label radius warning'><b>#{daysRemaining}</b></span>"
    else
    	"<span class='label radius success'><b>#{daysRemaining}</b></span>"
    end
	end

  def get_EvaluationLicense_Counts()
    licenses = License.all
    if licenses
    	@evalCount = 0
	    @subsCount = 0
	    @perpCount = 0
      licenses.each do |lic|
	    	if lic.jsonLicense.include? "O=Evaluation"
	 				@evalCount = @evalCount + 1
	    	end
	    end
    end
    nil
  end

end
