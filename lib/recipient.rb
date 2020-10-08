class Recipient
  attr_reader :slack_id, :name

  def initialize(slack_id, name)
    @slack_id = slack_id
    @name = name
  end

  def send_message(message)
    raise NotImplementedError, 'Implement me in a child class!'
  end

  def self.get(url, params)
    raise NotImplementedError, 'Implement me in a child class!'
  end

  private

  def details
    raise NotImplementedError, 'Implement me in a child class!'
  end

  def self.list_all
    raise NotImplementedError, 'Implement me in a child class!'
  end

end
