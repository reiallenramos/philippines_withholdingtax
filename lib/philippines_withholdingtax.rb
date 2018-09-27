class WithholdingTaxCalculator
  # Calculate your Withholding Tax!
  #
  # Example:
  #     >> WithholdingTaxCalculator.new(payroll_period: "daily", 9000).call
  #     => 2469.19
  #
  # Arguments
  #     payroll_period: (string), possible values: ["daily", "monthly", "semimonthly", "monthly"]
  #     compensation_level: (number)

  def initialize(options)
    @payroll_period = options[:payroll_period]
    @compensation_level = options[:compensation_level]
  end

  def call
    set_period
    set_bracket
    set_minimum_tax
    set_percentage_on_excess
    calculate_excess
    calculate_tax_from_excess
    return_withholding_tax
  end

  private

  def set_period
    @period = case @payroll_period
              when "daily" then DAILY
              when "weekly" then WEEKLY
              when "semimonthly" then SEMIMONTHLY
              when "monthly" then MONTHLY
              end
  end

  def set_bracket
    if @compensation_level >= @period[:bracket_6][:compensation_level]
      @bracket = @period[:bracket_6]
    elsif @compensation_level >= @period[:bracket_5][:compensation_level]
      @bracket = @period[:bracket_5]
    elsif @compensation_level >= @period[:bracket_4][:compensation_level]
      @bracket = @period[:bracket_4]
    elsif @compensation_level >= @period[:bracket_3][:compensation_level]
      @bracket = @period[:bracket_3]
    elsif @compensation_level >= @period[:bracket_2][:compensation_level]
      @bracket = @period[:bracket_2]
    elsif @compensation_level >= @period[:bracket_1][:compensation_level]
      @bracket = @period[:bracket_1]
    end
  end

  def set_minimum_tax
    @minimum_tax = @bracket[:minimum_tax]
  end

  def set_percentage_on_excess
    @percentage_on_excess = @bracket[:percentage_on_excess]
  end

  def calculate_excess
    @excess = @compensation_level - @bracket[:compensation_level]
  end

  def calculate_tax_from_excess
    @tax_from_excess = @excess * @percentage_on_excess
  end

  def return_withholding_tax
    @minimum_tax + @tax_from_excess
  end
end

require 'tables/tables'