#!/usr/bin/env bash
# Box:  , ,
# Diamond: ,,
# Circle: , ,

get_workspaces() {
  CURRENT=$(hyprctl activeworkspace -j | jq '.id')
  WORKSPACES_JSON=$(hyprctl workspaces -j)

  WORKSPACE_WINDOWS=$(echo "$WORKSPACES_JSON" | jq 'map({key: .id | tostring, value: .windows}) | from_entries')

  seq 1 10 | jq --argjson windows "$WORKSPACE_WINDOWS" --argjson current "$CURRENT" --slurp -Mc '
    map(tostring) | 
    map({
      id: ., 
      windows: ($windows[.] // 0), 
      current: (. == ($current | tostring)),
      symbol: if . == ($current | tostring) then "" else "" end
    })'
}

get_workspaces

# Keep listening to hyprland events
socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
  get_workspaces
done
