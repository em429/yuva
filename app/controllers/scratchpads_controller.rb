class ScratchpadsController < ApplicationController

    def update
      @scratchpad = Scratchpad.first
  
      if @scratchpad.update(scratchpad_params)

        respond_to do |format|
          format.turbo_stream do
            render turbo_stream: turbo_stream.replace('scratchpad', partial: 'scratchpad/form', locals: { scratchpad: @scratchpad })
          end
          format.html { redirect_to dashboard_path, notice: 'Scratchpad was successfully updated.' }
        end



        #render partial: 'scratchpad/form', locals: { scratchpad: @scratchpad }
        #redirect_to dashboard_path, notice: 'Scratchpad was successfully updated.'
      end
    end
  
    private
  
    def scratchpad_params
      params.require(:scratchpad).permit(:contents)
    end
  end