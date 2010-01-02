class DisplayController < ApplicationController

  before_filter :find_list, :except =>:empty_list

  def index
    @schools = School.find_schools_to_display
  end

  def add_to_list
    school = School.find(params[:id])
    if !(@list.items.find { |schoolinlist| schoolinlist == school })
    @current_item =  @list.add_school(school)
     respond_to do |format|
        format.js if request.xhr?
        format.html {redirect_to_index}
      end
   else
      flash[:notice] =  "You already have this school in your list"
      redirect_to :action => "index"
   end
  rescue ActiveRecord::RecordNotFound
    logger.error("Attempt to access invalid product id #{params[:id]}")
    redirect_to_index("Invalid Product")
  end

  def empty_list
    session[:list] = nil
    redirect_to_index( "You have just emptied your list")
  end

  def checkout
    @list = find_list
    if @list.items.empty?
      redirect_to_index("Your cart is empty" )
    else
      @order = Order.new
    end
  end

  def remove_from_list
    school = School.find(params[:id])
    @list.remove_school(school);
   # respond_to do |format|
    #  format.js if request.xhr?
     # format.html {redirect_to_index}
    #end
   # redirect_to_index
  end

  def search

    #uncomment for solr
    query = params[:query]

    #use sql query for search
    #query = params[:query]
   # @results = School.find_schools_by_search_criteria(query)


    search = School.search do
      keywords query
    end

    @results = search.results
end
  def save_order
    @list = find_list
    @order = Order.new(params[:order])
    @order.add_line_items_from_list(@list)
    if @order.save
      session[:list] = nil
      redirect_to_index("Thank you for your order" )
    else
      render :action => 'checkout'
    end
  end

protected

  def authorize
  end
private
  def find_list
    @list = (session[:list] ||= List.new)
  end

  def redirect_to_index(msg = nil)
    flash[:notice] = msg if msg
    redirect_to(:action => "index")
  end

end
