require_relative '../workflow/payment_workflow'
class Payment < ActiveRecord::Base
	include PaymentWorkflow

	def update_product_to_cherry
		self.status_date = Time.now
	end

	def update_product_to_bananas
		self.product = 'Bananas'
	end

end
