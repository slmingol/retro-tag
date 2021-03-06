require "#{__dir__}/default"

module AwsTag
  class Ec2DhcpOptions < Default

    def aws_region_services_name
      %w[EC2]
    end

    def friendly_service_name
      'EC2 DHCP Options Sets'
    end

    def aws_client(region:)
      Aws::EC2::Client.new(region: region, credentials: credentials, retry_limit: client_retry_limit)
    end

    #################################

    def tag_client_method
      'describe_tags'
    end

    def tag_client_method_args(region)
      {
        filters: [
          {
            name: 'resource-type',
            values: [ 'dhcp-options' ]
          }
        ]
      }
    end

    def tag_response_collection
      'tags'
    end

    def tag_response_resource_name
      'resource_id'
    end

    ##################################



  end

end
