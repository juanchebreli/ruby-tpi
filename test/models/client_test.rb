require "test_helper"

class ClientTest < ActiveSupport::TestCase
  def setup
    @client= clients(:one)
  end
  
  test 'invalid without cuild' do
    @client.cuild= nil
    refute @client.valid?, 'client is valid without a cuild'
    assert_not_nil @client.errors[:cuild], 'no validation error for cuild'
  end

  test 'invalid without nombre' do
    @client.nombre= nil
    refute @client.valid?, 'client is valid without a nombre'
    assert_not_nil @client.errors[:nombre], 'no validation error for nombre'
  end

  test 'invalid without iva' do
    @client.iva= nil
    refute @client.valid?, 'client is valid without a iva'
    assert_not_nil @client.errors[:iva], 'no validation error for iva'
  end

  test 'invalid without mail' do
    @client.mail= nil
    refute @client.valid?, 'client is valid without a mail'
    assert_not_nil @client.errors[:mail], 'no validation error for mail'
  end

  test 'add phones to client' do
    @client.add_phone(2213523452)
    @client.add_phone(2213523452)
    assert_equal 2,@client.phones.count
  end
end
