class ProjectCategory < ActiveRecord::Base
  belongs_to :project, required: true
  belongs_to :category, required: true, counter_cache: :projects_count
end
