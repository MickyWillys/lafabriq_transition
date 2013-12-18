class Createemails < ActiveRecord::Migration
  def up
	create_table :prospects do |t| #Crée la table todos
	t.string :email #Type de champ, nom du champ
	end
  end

  def down
  end
end
