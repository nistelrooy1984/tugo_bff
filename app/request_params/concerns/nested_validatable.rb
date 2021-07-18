# frozen_string_literal: true

module NestedValidatable
extend ActiveSupport::Concern

  included do
    validate :validate_nested_attributes
  end

  private

  def validate_nested_attributes
    self.class::VALIDATE_ATTRIBUTES.each do |attr|
      item = send(attr)

      if item.is_a?(Array)
        validate_array(item, attr)
      else
        next if item.nil? || item.valid?

        validate_object(item, attr)
      end
    end

    # rubocop:disable Style/GuardClause, Rails/Output
    # for Debug
    if Rails.env.test?
      p errors.to_h unless errors.empty?
    end
    # rubocop:enable Style/GuardClause, Rails/Output
  end

  def validate_object(obj, attr)
    obj.errors.messages.each_pair { |field_name, error_msgs|
      error_msgs.each { |message|
        errors.add("#{attr}.#{field_name}", message.to_s)
      }
    }
  end

  def validate_array(array, attr)
    array.each_with_index do |val, index|
      next if val.valid?

      val.errors.messages.each_pair { |field_name, error_msgs|
        error_msgs.each { |message|
          errors.add("#{attr}.#{index}.#{field_name}", message.to_s)
        }
    }
    end
  end
end
    