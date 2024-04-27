module ApplicationHelper
  def nav_link_classes(path = nil)
    defaults = 'ml-8 whitespace-nowrap text-base font-medium text-gray-500 hover:text-gray-900'
    defaults.gsub!('gray', 'black').gsub!('-medium', '-bold') if request.path == "/#{path}"
    defaults
  end

  def flash_classes
    defaults = 'text-green-500 bg-green-100'
    defaults.gsub!('green', 'red') if flash[:alert].present?
    defaults
  end

  def flash_icon
    gpath = 'M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
    gpath = 'M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z' if flash[:alert].present?
    "<svg aria-hidden='true' class='w-5 h-5' fill='currentColor' viewBox='0 0 20 20' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='#{gpath}' clip-rule='evenodd'></path></svg>"
  end

  def script_tags
    @script_tags ||= ScriptTag.enabled
  end
end
