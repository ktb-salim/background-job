class MailingsController < ApplicationController
	def deliver
		call_rake :send_mailing, :mailing_id => params[:id]
		flash[:notice] = "Delivering mailing"
		redirect_to mailings_url
	end

	def index
		@mailing = Mailing.all
		# respond_to do |format|
		# 	format.html { render :index }
		# end
	end

	def show
		@mailing = Mailing.find(params[:id])
		respond_to do |format|
			format.html { render :show }
		end
	end

	def new
		@mailing = Mailing.new
	end

	def create
		@mailing = Mailing.new(params[:mailing])
		if @mailing.save
			flash[:notice] = "Successfully created mailing."
			redirect_to @mailing
		else
			render :action => 'new'
		end
	end

	def edit
		@mailing = Mailing.find(params[:id])
	end
	handle_asynchronously :edit, :run_at => Proc.new { 5.minutes.from_now }

	def update
		@mailing = Mailing.find(params[:id])
		if @mailing.update_attributes(params[:mailing])
			flash[:notice] = "Successfully updated mailing."
			redirect_to @mailing
		else
			render :action => 'edit'
		end
	end

	def destroy
		@mailing = Mailing.find(params[:id])
		@mailing.destroy
		flash[:notice] = "Successfully destroyed mailing."
		redirect_to mailings_url
	end
end
