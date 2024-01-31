class PatientSearch
  attr_accessor :search_term, :opportunities

  def initialize(search_term)
    @search_term = search_term&.squish
  end

  def results
    @opportunities = Opportunity.joins('LEFT JOIN members ON opportunities.patient_id = members.id OR opportunities.doctor_id = members.id')
    @opportunities = filter_opportunities if search_term.present?
    @opportunities.distinct
  end

  def filter_opportunities
    @opportunities.where('members.first_name ILIKE :query OR
      members.last_name ILIKE :query OR
      opportunities.procedure_name ILIKE :query',
     query: "%#{search_term}%")
  end
end

