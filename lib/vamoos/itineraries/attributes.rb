# frozen_string_literal: true

require_relative 'attributes/base'
require_relative 'attributes/details'
require_relative 'attributes/directories'
require_relative 'attributes/documents'
require_relative 'attributes/features'
require_relative 'attributes/locations'
require_relative 'attributes/metas'
require_relative 'attributes/notifications'
require_relative 'attributes/passcode_groups'
require_relative 'attributes/pois'
require_relative 'attributes/travellers'

module Vamoos
  module Itineraries
    module Attributes
      include Base
      include Details
      include Directories
      include Documents
      include Features
      include Locations
      include Metas
      include Notifications
      include PasscodeGroups
      include Pois
      include Travellers
    end
  end
end
