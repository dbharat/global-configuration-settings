class TestGlobalConfigsController < ApplicationController
	def index
    @test_global_configs = TestGlobalConfig.all
	end

	def new
    @test_global_config = TestGlobalConfig.new
	end

	def create
    @test_global_config = TestGlobalConfig.new(config_params)
    if @test_global_config.save
      redirect_to root_path
    else
      render "new"
    end
	end

	def edit
    @test_global_config = TestGlobalConfig.where(id:params[:id]).first
	end

	def update
    @test_global_config = TestGlobalConfig.where(id:params[:id]).first
    if @test_global_config.update_attributes(config_params)
      redirect_to root_path
    else
      render "edit"
    end
	end

	def destroy
    @test_global_config = TestGlobalConfig.where(id:params[:id]).first
    @test_global_config.destroy
    redirect_to root_path
	end

  private
  def config_params
    params.require(:test_global_config).permit(:name, :value, :value_type)
  end
end
