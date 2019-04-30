class BaseController
  def initialize(repository)
    @repository = repository
  end

  def list
    elements = @repository.all
    @view.display_elements(elements)
  end
end
