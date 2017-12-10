class ApplicationService
  private

  def create_struct(*fields)
    if fields.include? :errors
      raise ArgumentError, "`errors' field is already included"
    end

    Struct.new(*fields, :errors) do
      def success?
        errors.blank?
      end
    end
  end
end
