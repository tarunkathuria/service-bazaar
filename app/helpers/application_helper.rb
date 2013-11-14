module ApplicationHelper
  include SessionsHelper
  def all_categories
    ActiveRecord::Base.connection.execute <<-SQL
    select * from categories;
    SQL
  end

  def all_category_names
    all_categories.map { |x| x[1] }
  end

  def all_category_descriptions
    all_categories.map { |x| x[2] }
  end
end
