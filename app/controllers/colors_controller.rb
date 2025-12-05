class ColorsController < ApplicationController
    def match
      input_color = params[:color]
      matched = ColorMatcher.new(input_color).call

      @input_color = input_color
      @matched_color = matched

      render :result
    end
end
