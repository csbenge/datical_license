class HomeController < ApplicationController
	include LicensesHelper

	def download_lic

		license = License.find(params[:format])
		companyName = license.companyName.gsub(' ', '_')
    filename = companyName + "-" + getYYYYMMDD(license.notAfter)
    binLicense   = "#{Rails.root}" + "/app/public/" + filename + ".lic"
    downloadLicense = filename + ".lic"

		File.open(binLicense, 'wb') { |file| file.write(license.binLicense) }
	  send_file(
	    "#{binLicense}",
	    filename: "#{downloadLicense}",
	    type: "application/bin"
	  )
	end

end