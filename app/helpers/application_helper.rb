module ApplicationHelper
  def select_months(quarter)
    if quarter == 'Q1'
      [['1月', '1月'], ['2月', '2月'], ['3月', '3月']]
    elsif quarter == 'Q2'
      [['4月', '4月'], ['5月', '5月'], ['6月', '6月']]
    elsif quarter == 'Q3'
      [['7月', '7月'], ['8月', '8月'], ['9月', '9月']]
    else
      [['10月', '10月'], ['11月', '11月'], ['12月', '12月']]
    end
  end
end
