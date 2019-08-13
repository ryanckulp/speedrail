module ApplicationHelper
  def active_tab(matcher)
    request.env['REQUEST_PATH'] == matcher ? 'is-active' : ''
  end
end
