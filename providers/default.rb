
# Coerces the ruby type into a string that can
# be passed to gsettings via the command line
def format_value_for_commandline(v)
  if v.kind_of?(String)
    # It's a hard coded string value, user already did the
    # formatting so pass it along to the command
    return "'#{v}'"
  elsif v.kind_of?(Array)
    return '"[\'' + v.join("', '") + '\']"'
  else
    v = v.to_s
    return "'#{v}'"
  end
end

action :set do
  value = format_value_for_commandline(new_resource.value)
  cmd = "dbus-launch gsettings set #{new_resource.schema} #{new_resource.option} #{value}"
  execute "Updating gsetting config #{new_resource.schema} #{new_resource.option}" do
    command cmd
    user new_resource.user
  end
end

action :reset do
  if new_resource.recursive then
    cmd = "dbus-launch gsettings reset-recursively #{new_resource.schema}"
    cmd_name = "Recursively unsetting gsettings key '#{new_resource.schema}'"
  else
    schema = new_resource.schema
    key = new_resource.option
    cmd = "dbus-launch gsettings reset-recursively #{schema} #{key}"
    cmd_mame = "Unsetting gsettings key '#{new_resource.key}'"
  end
  execute cmd_name do
    command cmd
    user new_resource.user
  end
end
