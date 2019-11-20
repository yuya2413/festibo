module Users::ReservationsHelper
  def converting_to_jpy(charge)
    "#{charge.to_s(:delimited, delimiter: ',')}円"
  end
end
