# app/services/color_matcher.rb
class ColorMatcher
  require 'color'  # gem 'color' を使う場合

  def initialize(hex)
    @color = Color::RGB.from_html(hex)
  end

  def call
    complementary
  end

  private

  def complementary
    hsl = @color.to_hsl
    # 色相を180度回転 → 補色
    h = (hsl.h + 180) % 360
    Color::HSL.new(h, hsl.s, hsl.l).to_rgb.html
  end
end