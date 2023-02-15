import platform

import dotbot
from dotbot.dispatcher import Dispatcher


class IfOs(dotbot.Plugin):
    OS_MAP = {"Windows": "if-windows", "Linux": "if-wsl", "Darwin": "if-macos"}

    def can_handle(self, directive):
        return directive in self.OS_MAP.values()

    def handle(self, directive, data):
        os_family = platform.system()
        applicable_directive = self.OS_MAP[os_family]

        if directive == applicable_directive:
            self._log.debug("Matched OS family %s" % os_family)
            return self._run_internal(data)
        else:
            self._log.debug("Skipped %s directive" % directive)
            return True

    def _run_internal(self, data):
        dispatcher = Dispatcher(
            self._context.base_directory(),
            only=self._context.options().only,
            skip=self._context.options().skip,
            options=self._context.options(),
        )
        return dispatcher.dispatch(data)
