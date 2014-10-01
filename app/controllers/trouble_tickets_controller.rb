class TroubleTicketsController < ApplicationController

  # POST /trouble_tickets.json
  def create
    @user = User.find(trouble_ticket_params[:user_id])
    TT_Mailer.new_trouble_ticket(@user, "Trouble Ticket: " + trouble_ticket_params[:subject], trouble_ticket_params[:content]).deliver

    respond_to do |format|
      format.json { head :ok }
    end

    # error catching mailer errors
  rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError => e
    logger.error 'ERROR: mailer failed to send #{trouble_ticket_params[:content]} for user #{trouble_ticket_params[:user_id]}'
    head :internal_server_error
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def trouble_ticket_params
      params.require(:trouble_ticket).permit(:user_id, :subject, :content)
    end
end
