require "#{__dir__}/default"

module AwsResource
  class VpcNetworkAcl < Default

    def aws_region_services_name
      %w[EC2]
    end

    def friendly_service_name
      'VPC Network ACLs'
    end

    def aws_client(region:)
      Aws::EC2::Client.new(region: region, credentials: credentials, retry_limit: client_retry_limit)
    end

    def aws_client_method
      'describe_network_acls'
    end

    def aws_client_method_args
      {}
    end

    def aws_response_collection
      'network_acls'
    end

    def aws_response_resource_name
      'network_acl_id'
    end

    def aws_event_name
      %w[CreateNetworkAcl]
    end

    def resource_name_exists?(**args)
      (args[:response_elements]['networkAcl'] &&
          args[:response_elements]['networkAcl']['networkAclId'])
    end

    def resource_name(**args)
      args[:response_elements]['networkAcl']['networkAclId']
    end

  end

end
