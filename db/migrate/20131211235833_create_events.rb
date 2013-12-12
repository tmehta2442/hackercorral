class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|

    		t.string :event_name
    		t.string :event_location
    		t.text	 :event_details
    		
      t.timestamps
    end
  end
end
