class User < ActiveRecord::Base
  acts_as_authentic

  def admin?
    puts "TIPO: #{type}"
    type== 'Admin' ? true: false
  end
end
