class LicensesController < ApplicationController
  include LicensesHelper
  before_action :logged_in_user, only: [:index, :new, :edit, :update, :destroy]
  before_action :set_license, only: [:show, :edit, :update, :destroy]

  # GET /licenses
  # GET /licenses.json
  def index
    #@licenses = License.all
    @licenses = License.paginate(page: params[:page])
  end

  # GET /licenses/1
  # GET /licenses/1.json
  def show
  end

  # GET /licenses/new
  def new
    @license = License.new
  end

  # GET /licenses/1/edit
  def edit
  end

  # POST /licenses
  # POST /licenses.json
  def create
    @license = License.new(license_params)

    @license.consumerAmount = 1
    @license.issuer         = "CN=" + @license.companyName
    @license.subject        = "Datical DB " + @license.consumerType
    @license.holder         = "CN=" + @license.companyName + ",O=" + params[:license][:companyStage]
    @license.info           = "Datical DB " + params[:license][:companyStage] + " License"
    @license.user_id        = current_user.id

    # Make the JSON input
    jsonLicense = LicensesHelper::LICENSEJSON
    jsonLicense.gsub! 'XconsumerAmountX', '1'
    jsonLicense.gsub! 'XconsumerTypeX', @license.consumerType
    jsonLicense.gsub! 'XissuerX', @license.issuer
    jsonLicense.gsub! 'XcompanyNameX', @license.companyName
    jsonLicense.gsub! 'XcompanyStageX', params[:license][:companyStage]
    jsonLicense.gsub! 'XnotAfterX', getYYYYMMDD(@license.notAfter)

    puts "*****"
    puts jsonLicense
    puts "*****"

    # Make license
    # write the jsonLicense to a file
    jsonFilename  = "scripts/" + @license.companyName + "-" + getYYYYMMDD(@license.notAfter) + ".json"
    binFilename   = "scripts/" + @license.companyName + "-" + getYYYYMMDD(@license.notAfter) + ".lic"
    File.open(jsonFilename, 'w') { |file| file.write(jsonLicense) }
    #cmd = "scripts/keygen create test.lic test.json"
  
    #output = ""
    #status = POpen4::popen4("#{cmd}") do |stdout, stderr, stdin|
    #  output = stdout.read + stderr.read
    #end


    @license.jsonLicense = jsonLicense

    respond_to do |format|
      if @license.save
        format.html { redirect_to @license, notice: 'License was successfully created.' }
        format.json { render :show, status: :created, location: @license }
      else
        format.html { render :new }
        format.json { render json: @license.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /licenses/1
  # PATCH/PUT /licenses/1.json
  def update
    respond_to do |format|
      if @license.update(license_params)
        format.html { redirect_to @license, notice: 'License was successfully updated.' }
        format.json { render :show, status: :ok, location: @license }
      else
        format.html { render :edit }
        format.json { render json: @license.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /licenses/1
  # DELETE /licenses/1.json
  def destroy
    @license.destroy
    respond_to do |format|
      format.html { redirect_to licenses_url, notice: 'License was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_license
      @license = License.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def license_params
      params.require(:license).permit(:consumerAmount, :consumerType, :issuer, :subject, :holder, :notAfter, :info, :companyName, :contactName, :contactEmail, :user_id)
    end

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = I18n.t('msg_please_login')
        redirect_to login_url
      end
    end
end
