module ProjectsHelper

  def humanized_project_creators(project)
    if project.group?
      project.group.name
    else
      project.users[0]
    end
  end

  def contest_filter_options(contests, selected)
    options = contests.map do |contest|
      [contest.name, contest_path(contest)]
    end
    options_for_select options, contest_path(selected)
  end

  def category_filter_options(categories)
    options = categories.map do |category|
      [category.name, category.id]
    end

    options.unshift ['Filter by Category', '']
    options_for_select options
  end

end
