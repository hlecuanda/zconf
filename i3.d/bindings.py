# -*- coding: utf-8 -*-
"""
Display key bindings dynamically

Uses asynchronous update via i3 IPC events.
Provides instant help for keybindings, untilyou remember them

Configuration parameters:
    format: format of the title, (default "{title}")
    max_width: maximum width of block (in symbols).
        If the title is longer than `max_width`,
        the title will be truncated to `max_width - 1`
        first symbols with ellipsis appended. (default 120)

Requires:
    i3ipc: (https://github.com/acrisci/i3ipc-python)

@author Hector Lecuanda (H-Lo) https://github.com/hlecuanda
@license BSD

SAMPLE OUTPUT
{'c': 'command mode', 'x': 'exec xterm'}
"""

from threading import Thread

import i3ipc


class Py3status:
    """
    """
    # available configuration parameters
    format = "{title}"
    #  max_width = 120

    def post_config_hook(self):
        # we are listening to i3 events in a separate thread
        t = Thread(target=self._loop)
        t.daemon = True
        t.start()

    def _loop(self):
        def get_title(conn):
            tree = conn.get_tree()
            w = tree.find_focused()
            p = w.parent

            title = w.name
            if title is None or w.type == "workspace":
                title = ''

            if len(title) > self.max_width:
                title = title[:self.max_width - 1] + "…"

            return self.py3.safe_format(self.format, {'title': title})

        def update_title(conn, e):

            # catch only focused window title updates
            title_changed = hasattr(e, "container") and e.container.focused

            # check if we need to update title due to changes
            # in the workspace layout
            layout_changed = (
                hasattr(e, "binding") and
                (e.binding.command.startswith("layout") or
                 e.binding.command.startswith("move container") or
                 e.binding.command.startswith("border"))
            )

            if title_changed or layout_changed:
                self.title = get_title(conn)
                self.py3.update()

        conn = i3ipc.Connection()

        self.title = get_title(conn)  # set title on startup
        self.py3.update()

        # The order of following callbacks is important!

        # clears the title on empty ws
        conn.on('workspace::focus', clear_title)

        # clears the title when the last window on ws was closed
        conn.on("window::close", clear_title)

        # listens for events which can trigger the title update
        conn.on("window::title", update_title)
        conn.on("window::focus", update_title)
        conn.on("binding", update_title)

        conn.main()  # run the event loop

    def window_title_async(self):
        return {
            'cached_until': self.py3.CACHE_FOREVER,
            'full_text': self.title,
        }


if __name__ == "__main__":
    """
    Run module in test mode.
    """
    config = {

    }
    from py3status.module_test import module_test
    module_test(Py3status, config=config)
