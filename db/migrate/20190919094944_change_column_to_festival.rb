class ChangeColumnToFestival < ActiveRecord::Migration[5.2]

#変更内容
  def up
  	change_column_default :festivals, :value_1, nil
  	change_column_default :festivals, :value_2, nil
  	change_column_default :festivals, :value_3, nil
  	change_column_default :festivals, :value_4, nil
  	change_column_default :festivals, :value_5, nil
  end
#変更前
  def down
  	change_column_default :festivals, :value_1, 2
  	change_column_default :festivals, :value_2, 2
  	change_column_default :festivals, :value_3, 2
  	change_column_default :festivals, :value_4, 2
  	change_column_default :festivals, :value_5, 2
   end


end
