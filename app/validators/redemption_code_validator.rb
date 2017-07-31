class RedemptionCodeValidator < ActiveModel::Validator

  def validate(record)
    @record = record
    return true if redemption_code.blank?
    errors << I18n.t('errors.messages.taken') if code_already_taken?
    errors << I18n.t('activerecord.errors.attributes.redemption_code.invalid') if code_invalid?
  end

  private

    def code_already_taken?
      User.where(redemption_code: redemption_code).where.not(id: @record.id).present?
    end

    def code_invalid?
      !RedemptionCode.exists?(code: redemption_code)
    end

    def errors
      @record.errors[:redemption_code]
    end

    def redemption_code
      @record.redemption_code
    end

end
