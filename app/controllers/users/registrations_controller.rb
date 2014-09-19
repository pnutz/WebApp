# app/controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController

  def create
    super

    ip_address = remote_ip()
    logger.debug "request ip address: " + ip_address

    geoip_country = GeoIP.new('GeoIP.dat').country(ip_address)
    country_country = Country.find_country_by_alpha3(geoip_country.country_code3)
    currency = Currency.where(:code => country_country.currency['code'])[0]

    UserSettings.create(user_id: current_user.id, currency_id: currency.id)
  end

  def remote_ip
    if request.remote_ip == '127.0.0.1'
      # hard-coded remote address
      '24.87.70.181'
    else
      request.remote_ip
    end
  end
end
