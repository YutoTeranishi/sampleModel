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
=begin
    if request.post? then
      Person.create(person_params)
    end
=end
  @person = Person.new(person_params)
    if @person.save then
      redirect_to '/people'
    else
=begin
      re = ''
      @person.errors.messages.each do |key,vals|
        vals.each do |val|
          re +='<span style="color:red">' + key.to_s + '</span> ' + val + '<br>'
        end
      end
      @msg = re.html_safe
=end
      render 'add'
    end
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

      #複数検索&&曖昧検索

      f = Array.new
      if params[:find].to_s.include?(",") then
        f = params[:find].split(",")
      else params[:find].to_s.include?(" ")
        f = params[:find].split(" ")
      end
    #sをここで宣言しないとスコープがeach内のみになる
    s = String.new
    f.each do |obj_tmp|
      obj = '\'%'+obj_tmp+'%\''
      s += '(mail like ' +obj+ ' or name like '+obj+' or age like '+obj+')'

      if f.last != obj_tmp then
        s += ' or '
      end
    end
    #デバック用
    # puts s
      #曖昧検索
      #f = '%'+params[:find]+'%'
        #@people = Person.where "mail like ? or name like ? or age like ? " ,f,f,f
        @people = Person.where s
    end
  end

  private def person_params
    params.require(:person).permit(:name,:age,:mail)
  end

end
