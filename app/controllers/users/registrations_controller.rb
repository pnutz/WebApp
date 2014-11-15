# app/controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController

  def new
    @disable_nav = true

    super
  end

  def create
    @disable_nav = true

    super
  end

  def remote_ip
    if request.remote_ip == '127.0.0.1'
      # hard-coded remote address
      # TODO: REMOVE LATER
      '24.87.70.181'
    else
      request.remote_ip
    end
  end

  protected

  # override sign_up (called after User::Create, just signs in user)
  def sign_up(resource_name, resource)
    ip_address = remote_ip()
    logger.debug "request ip address: " + ip_address

    geoip_country = GeoIP.new('GeoIP.dat').country(ip_address)
    country_country = Country.find_country_by_alpha3(geoip_country.country_code3)
    currency = Currency.where(:code => country_country.currency['code'])[0]

    UserSetting.create(user_id: resource.id, currency_id: currency.id, hotkey_receipt: 65, hotkey_vault: 86)

    true
  end
end
