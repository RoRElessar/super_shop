class Order < ApplicationRecord
  include AASM

  belongs_to :cart
  belongs_to :user

  after_create :set_order_number

  aasm do
    state :new, initial: true
    state :new, :paid, :sent, :canceled, :refunded, :pending

    event :pending_state do
      transitions from: %i[new], to: :pending
    end

    event :paid_state do
      transitions from: %i[new pending], to: :paid
    end

    event :sent_state do
      transitions from: %i[paid], to: :sent
    end

    event :canceled_state do
      transitions from: %i[new paid sent], to: :canceled
    end

    event :refunded_state do
      transitions from: %i[canceled], to: :refunded
    end
  end

  protected

  def set_order_number
    date = Date.today.strftime('%Y-%m')
    self.order_number = "#{date}-#{id}"
    self.save
  end

end
