class AddEnderecoVagaToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :endereco_vaga, :string
  end
end
