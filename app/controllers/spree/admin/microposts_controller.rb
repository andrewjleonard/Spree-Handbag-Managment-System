module Spree
  module Admin
    class MicropostsController < ResourceController
  before_action :spree_current_user, only: [:create, :destroy] # Needs updating to ensure only admin can destroy and .. old:
  #  before_action :logged_in_user, only: [:create, :destroy]
  #  before_action :correct_user,   only: :destroy

  def create
    @micropost = spree_current_user.microposts.build(micropost_params)
    @micropost.handbag_id = params[:micropost][:handbag_id]
    if @micropost.save
      flash[:success] = "Post added!"
      redirect_to :back
    else
      render :back
    end
  end

  def destroy
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :picture)
    end
      def model_class
        Micropost
      end
end
end
end