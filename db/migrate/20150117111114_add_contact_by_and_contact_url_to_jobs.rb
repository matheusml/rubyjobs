class AddContactByAndContactUrlToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :contact_by, :integer, default: :email
    add_column :jobs, :contact_url, :string
    Job.update_all(contact_by: :email)
  end
end
