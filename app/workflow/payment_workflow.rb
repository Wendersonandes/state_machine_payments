module PaymentWorkflow
	extend ActiveSupport::Concern
	def self.included(klass)

		klass.send(:state_machine, :state, :initial => :pending) do
			after_transition :on => :success, :do => :update_status_date
			after_transition any => :failed do |payment, transition|
				payment.status_date = Time.now
			end

			event :proccess do
				transition [:pending, :failed] => :processing
			end

			event :failed do
				transition :processing => :failed
			end

			event :success do
				transition :processing => :successfull
			end

			event :refund do
				transition :successfull => :refund
			end
		end

	end

end
