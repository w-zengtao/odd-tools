require "odd-tools/version"
require "bigdecimal"

module OddTools
  class Error < StandardError; end

  # 知道两边赔率算抽水
  def self.pumping(left_odd, right_odd)
    left_odd, right_odd = BigDecimal(left_odd, 16), BigDecimal(right_odd, 16)
    return (1.0 - (left_odd * right_odd) / (left_odd + right_odd))
  end

  # 知道赔率和抽水计算概率
  def self.probability(pump, odd)
    pump, odd = BigDecimal(pump, 16), BigDecimal(odd, 16)
    return ((1.0 - pump) / odd)
  end

  # 知道赔率算两边胜率
  def self.odd_probability(left_odd, right_odd)
    pump = pumping(left_odd, right_odd)
    return probability(pump, left_odd), probability(pump, right_odd)
  end

  # 知道胜率和抽水算赔率
  def self.odd(pump, probability)
    pump, probability = BigDecimal(pump, 16), BigDecimal(probability, 16)
    return ((1.0 - pump) / probability)
  end

end
