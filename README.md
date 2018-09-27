# Calculate your Withholding Tax!
## Philippines

Based on 2017 Revenue Memorandum Circular No. 105-2017
* supports Daily, Weekly, Semi-monthly, and Monthly payroll periods

## Installation
Add to your Gemfile:

```ruby
gem 'philippines_withholdingtax', github: 'reiallenramos/philippines_withholdingtax'
```

### Examples:

#### Daily
```console
WithholdingTaxCalculator.new(payroll_period: "daily", 9000).call
=> 2469.19
```

#### Weekly
```console
WithholdingTaxCalculator.new(payroll_period: "weekly", 1000000).call
=> 342500.05
```

#### Semimonthly
```console
WithholdingTaxCalculator.new(payroll_period: "semimonthly", 25000.2).call
=> 3333.3
```

#### Monthly
```console
WithholdingTaxCalculator.new(payroll_period: "monthly", 1234567.89).call
=> 399598.6414999999
```
