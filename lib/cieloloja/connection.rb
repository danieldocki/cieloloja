module Cieloloja
  class Connection
    attr_reader :environment
    def initialize
      @environment = eval(Cieloloja.environment.to_s.capitalize)
      port = 443
      @http = Net::HTTP.new(@environment::BASE_URL,port)
      @http.use_ssl = true
      if @environment.ssl_verify_mode == nil
        @http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      else
        @http.verify_mode = @environment.ssl_verify_mode                
      end
      https.ca_path = '/etc/ssl/certs' if File.exists?('/etc/ssl/certs') # Ubuntu
      https.ca_file = '/opt/local/share/curl/curl-ca-bundle.crt' if File.exists?('/opt/local/share/curl/curl-ca-bundle.crt') # Mac OS X      
      
      @http.open_timeout = 10*1000
      @http.read_timeout = 40*1000
    end
    
    def request!(params={})
      str_params = ""
      params.each do |key, value| 
        str_params+="&" unless str_params.empty?
        str_params+="#{key}=#{value}"
      end
      
      Rails.logger.info "Enviando XML para Cielo: #{str_params}"
      @http.request_post(self.environment::WS_PATH, str_params)
    end
  end
end