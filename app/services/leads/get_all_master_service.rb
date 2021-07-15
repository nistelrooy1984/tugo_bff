module Leads
  class GetAllMasterService < Leads::ServiceBase
    attr_reader :results

    def initialize(auth_header)
      @auth_header = auth_header
    end

    def run!
      responses = TugoCommon::GrpcService.call_grpc(
        nil,
        Settings.leads.host,
        Tugo::Leads::V1::LeadService,
        :GetAllMaster
      ).message

      set_results(responses)
    end

    def set_results(responses)
      @results = {
        master_countries: responses.countries&.each_with_object([]) do |country, arr|
          arr << Leads::CountryModel.new(
            id: country.id&.value,
            name: country.name&.value,
            order: country.order&.value,
            is_usable: country.is_usable&.value,
            created_at: country.created_at&.value,
            updated_at: country.updated_at&.value
          )
        end,

        master_provinces: responses.provinces&.each_with_object([]) do |province, arr|
          arr << Leads::ProvinceModel.new(
            id: province.id&.value, 
            name: province.name&.value, 
            master_country_id: province.master_country_id&.value,
            order: province.order&.value,
            is_usable: province.is_usable&.value,
            created_at: province.created_at&.value,
            updated_at: province.updated_at&.value
          )
        end,

        master_districts: responses.districts&.each_with_object([]) do |district, arr|
          arr << Leads::DistrictModel.new(
            id: district.id&.value, 
            name: district.name&.value, 
            master_province_id: district.master_province_id&.value,
            order: district.order&.value,
            is_usable: district.is_usable&.value,
            created_at: district.created_at&.value,
            updated_at: district.updated_at&.value
          )
        end,

        master_wards: responses.wards&.each_with_object([]) do |ward, arr|
          arr << Leads::WardModel.new(
            id: ward.id&.value, 
            name: ward.name&.value, 
            master_district_id: ward.master_district_id&.value,
            order: ward.order&.value,
            is_usable: ward.is_usable&.value,
            created_at: ward.created_at&.value,
            updated_at: ward.updated_at&.value
          )
        end
      }
    end
  end
end