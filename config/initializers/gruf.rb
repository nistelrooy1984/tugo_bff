# frozen_string_literal: true

Dir.glob(Rails.root.join('app/rpc_stubs/**/*_services_pb.rb')).sort.each do |f| require f end
