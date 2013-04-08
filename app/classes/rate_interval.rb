class RateInterval
  CODES = { bi_weekly: 'BW',
            fee_basis: 'FB',
            per_year: 'PA',
            per_day: 'PD',
            per_hour: 'PH',
            per_month: 'PM',
            piece_work: 'PW',
            student_stipend_paid: 'ST',
            school_year: 'SY',
            without_compensation: 'WC' }

  def self.get_code(name)
    CODES[parse(name)]
  end

  private

  def self.parse(name)
    name_str = name.downcase.squish.gsub(/ /, '_')
    case name_str.downcase
    when /^year$/ then :per_year
    when /^month(ly)?$/ then :per_month
    when /^hour(ly)?$/ then :per_hour
    else name_str.to_sym
    end
  end
end