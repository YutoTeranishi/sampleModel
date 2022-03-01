class PeopleController < ApplicationController
  layout 'people'

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

  def find
    @msg = 'please type search word...'
    @people = Array.new
    if request.post? then
      #begin
      #obj = Person.find(params['find'])
      #@people.push(obj)
      #rescue
      #  @msg = 'No exist...search again'
      #end

      #whereを使った検索
      #@people = Person.where "age >= ?" , params[:find]
      #複数検索
=begin
      if params[:find].to_s.include?(",") then
        f = params[:find].split(',')
      elsif params[:find].to_s.include?(" ") then
        f = params[:find].split(' ')
      else
        f = params[:find].to_s
      end
=end
      #曖昧検索
      f = '%'+params[:find]+'%'
      #f.each do |obj|
        @people = Person.where "mail like ? or name like ? or age like ? " ,f,f,f
      #end
    end
  end

  private def person_params
    params.require(:person).permit(:name,:age,:mail)
  end

end
