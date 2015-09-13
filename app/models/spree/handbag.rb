module Spree
  class Handbag < ActiveRecord::Base
    acts_as_list

    default_scope { order(:position) }

  end
end
