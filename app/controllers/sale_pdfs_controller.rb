class SalePdfsController < ApplicationController
  def salepdf
    @sale = Sale.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "LittleBeesSale_#{@sale.id}",
              template: "sale_pdfs/salepdf",
              formats: [:html],
              disposition: "attachment",
              encoding: 'UTF-8',
              layout: "pdf",
              page_size: 'A4',
              lowquality: true,
              zoom: 1,
              dpi: 75,
              filename: "Example"
      end
    end
  end
end
