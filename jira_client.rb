APIREF="https://rocketfuel.jira.com/rest/api/latest/"

class JIRA
  def initialize(args)
  end

  def self.json(slug,json)
    response = HTTParty.post(
      "#{APIREF}#{slug}",
      :basic_auth => self.auth,
      :headers => {'Content-Type' => 'application/json'},
    :body => json)
    doc = Nokogiri::HTML(response.body)
    doc.css('script, link').each { |node| node.remove }
    doc.css('body').text.squeeze(" \n")
  end

  def self.get(slug)
    response = HTTParty.get(
      "#{APIREF}#{slug}",
      :basic_auth => self.auth)
    JSON.parse(response.body)
  end

  def self.auth
    {:username => "roland", :password => "ilovejira2013"}
  end

end
