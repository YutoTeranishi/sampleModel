class PeopleController < ApplicationController
  def index
    @msg = 'Person data'
    @data = Person.all
  end
  def show
    @msg = 'Indexed data.'
    @data = Person.find(params[:id])
  end
  def add
    @msg = "add new data."
    @person = Person.new
  end
  def create
    if request.post? then
      Person.create(person_params)

=begin [行の先頭にしないと機能しない]
      obj = Person.create(
        name: params['name'],
        age:params['age'],
        mail:params['mail']
      )
=end
    end
    redirect_to '/people'
  end
  def edit
    @msg = "edit data.[id = " + params[:id] + "]"
    @person = Person.find(params[:id])
  end

  def update
    obj = Person.find(params[:id])
    obj.update(person_params)
    redirect_to '/people'
  end

  def delete
    obj = Person.find(params[:id])
    obj.destroy
    redirect_to '/people'
  end

  private def person_params
    params.require(:person).permit(:name,:age,:mail)
  end

end
