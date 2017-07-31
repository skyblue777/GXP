class ShipingDetails
  require 'shippo'
  def create_shipment
    Shippo::API.token = "shippo_test_8750275c450dd5b56894cf3eb2893cfcf1560b83"  
    address_from = {
        :name => 'Mr. Taddaquay',
        :street1 => '965 Mission St.',
        :city => 'San Francisco',
        :state => 'CA',
        :zip => '94117',
        :country => 'US',
        :phone => '+1 555 341 9393',
        :email => 'shippotle@goshippo.com' 
    }

    address_to = {
        :name => 'Mrs Hippo"',
        :street1 => '2920 Zoo Drive',
        :city => 'San Diego',
        :state => 'CA',
        :zip => '92101',
        :country => 'US',
        :phone => '+1 555 341 9393',
        :email => 'hippo@goshippo.com'
    }

    parcel = {
        :length => 5,
        :width => 1,
        :height => 5.555,
        :distance_unit => :in,
        :weight => 2,
        :mass_unit => :lb
    }

    shipment = Shippo::Shipment.create(
        :address_from => address_from,
        :address_to => address_to,
        :parcels => parcel,
        :async => false)

    begin
      if shipment[:status] == "SUCCESS"
        rate = shipment.rates.first
        transaction = Shippo::Transaction.create( 
          :rate => rate[:object_id], 
          :label_file_type => "PDF", 
          :async => false )        
        if transaction[:status] == "SUCCESS"
          puts "Label sucessfully generated:"
          puts "label_url: #{transaction.label_url}" 
          puts "tracking_number: #{transaction.tracking_number}" 
        else
          puts "Error generating label:"
          puts transaction.messages
        end        
      end
    rescue Shippo::Exceptions => e
      e.messages
    end 
             
  end
end