module IdeasHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_ideas_path
    elsif action_name == 'edit'
      idea_path
    end
  end
end