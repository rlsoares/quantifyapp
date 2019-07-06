class OfficialSheetsController < ApplicationController
  def index
    @official_sheets = OfficialSheet.all
    month = params[:id]
    @debts = Debt.where('extract(month from payday) = ?', month)
    @incomes = Income.where('extract(month from date) = ?', month)
  end



end
