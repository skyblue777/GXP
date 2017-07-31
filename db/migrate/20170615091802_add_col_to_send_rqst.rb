class AddColToSendRqst < ActiveRecord::Migration
  def change
    add_reference :send_requests, :user, index: true, foreign_key: true
  end
end
