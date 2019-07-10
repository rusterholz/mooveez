# A concern to disable writing or altering attributes on ActiveRecord models.
module ReadOnly
  extend ActiveSupport::Concern

  included do
    # Forbid altering attributes on records loaded from the database (records
    # created via .new are still writable but cannot be saved):
    after_find { |record| record.freeze }
  end

  def readonly?
    true
  end

  # Forbid saving changes or deleting records:
  %i[save destroy delete].each do |meth|
    define_method(meth) { raise ActiveRecord::ReadOnlyRecord }
    define_method(:"#{meth}!") { send(meth) }
  end
end
