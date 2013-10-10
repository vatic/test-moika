module CarWashesHelper

  def actions(actions, tag)
    ret = ""
    unless actions.empty?
      actions.each do |action|
        ret += "<#{tag}>#{action.action_text.text}</#{tag}>"
      end
    end
    raw(ret)
  end

end
