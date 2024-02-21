defmodule TaskboardWeb.Components.NavigationBar do
  use TaskboardWeb, :html

  def navigation_bar(assigns) do
    ~H"""
    <header class="absolute sticky inset-x-0 top-0 z-50 bg-slate-100">
      <nav class="mx-auto flex max-w-7xl items-center justify-between p-6 lg:px-8" aria-label="Global">
        <div class="flex lg:flex-1">
          <!-- link to homepage -->
          <.link href={~p"/"} class="-m-1.5 p-1.5">
            <span class="sr-only">TaskBoard</span>
            <!-- the site logo in the navbar -->
            <img class="h-8 w-auto" src={~p"/images/logo.png"} alt="logo" />
          </.link>
        </div>
        <!-- hamburger menu button -->
        <div class="flex lg:hidden">
          <button
            phx-click={JS.toggle(to: "#mobile-menu")}
            class="-m-2.5 inline-flex items-center justify-center rounded-md p-2.5 text-gray-700"
          >
            <span class="sr-only">Open main menu</span>
            <svg
              class="h-6 w-6"
              fill="none"
              viewBox="0 0 24 24"
              stroke-width="1.5"
              stroke="currentColor"
              aria-hidden="true"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5"
              />
            </svg>
          </button>
        </div>
        <div class="hidden lg:flex lg:gap-x-12">
          <a
            href={~p"/admin/projects"}
            class="text-sm font-semibold leading-6 text-gray-900 hover:text-blue-700"
          >
            SiteAdmin
          </a>
          <a href="#" class="text-sm font-semibold leading-6 text-gray-900 hover:text-blue-700">
            ProjectOwner
          </a>
          <a href="#" class="text-sm font-semibold leading-6 text-gray-900 hover:text-blue-700">
            Collaborate
          </a>
        </div>
        <!-- right justified links (login, etc) -->
        <div class="flex flex-1 items-center justify-end gap-x-6">
          <%= if @current_user do %>
            <div class="relative">
              <%!-- <button type="button" class="flex items-center gap-x-1 text-sm font-semibold leading-6 text-gray-900" aria-expanded="false"> --%>
              <button
                phx-click={JS.toggle(to: "#user-dropdown")}
                class="flex items-center gap-x-1 text-sm font-semibold leading-6 text-gray-900"
              >
                <%= @current_user.email %>
                <svg
                  class="h-5 w-5 flex-none text-gray-400"
                  viewBox="0 0 20 20"
                  fill="currentColor"
                  aria-hidden="true"
                >
                  <path
                    fill-rule="evenodd"
                    d="M5.23 7.21a.75.75 0 011.06.02L10 11.168l3.71-3.938a.75.75 0 111.08 1.04l-4.25 4.5a.75.75 0 01-1.08 0l-4.25-4.5a.75.75 0 01.02-1.06z"
                    clip-rule="evenodd"
                  />
                </svg>
              </button>
              <div
                id="user-dropdown"
                class="hidden absolute -left-8 top-full z-10 mt-3 w-56 rounded-xl bg-white p-2 shadow-lg ring-1 ring-gray-900/5"
              >
                <.link
                  phx-click={JS.hide(to: "#user-dropdown")}
                  href={~p"/auth/users/settings"}
                  class="block rounded-lg px-3 py-2 text-sm font-semibold leading-6 text-gray-900 hover:bg-gray-50"
                >
                  Settings
                </.link>
                <.link
                  phx-click={JS.hide(to: "#user-dropdown")}
                  href={~p"/auth/users/log_out"}
                  method="delete"
                  class="block rounded-lg px-3 py-2 text-sm font-semibold leading-6 text-gray-900 hover:bg-gray-50"
                >
                  Log out
                </.link>
              </div>
            </div>
            <.link
              href={~p"/auth/users/log_out"}
              class="rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
            >
              Log out
            </.link>
          <% else %>
            <.link
              href={~p"/auth/users/log_in"}
              class="text-[0.8125rem] leading-6 text-zinc-900 font-semibold hover:text-blue-700"
            >
              Log in
            </.link>
            <.link
              href={~p"/auth/users/register"}
              class="rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
            >
              Register
            </.link>
          <% end %>
        </div>
      </nav>
      <!-- Mobile menu, show/hide based on menu open state. -->
      <div id="mobile-menu" class="lg:hidden" role="dialog" aria-modal="true">
        <!-- Background backdrop, show/hide based on slide-over state. -->
        <div class="fixed inset-0 z-50"></div>
        <div class="fixed inset-y-0 right-0 z-50 w-full overflow-y-auto bg-white px-6 py-6 sm:max-w-sm sm:ring-1 sm:ring-gray-900/10">
          <div class="flex items-center justify-between">
            <.link href={~p"/"} class="-m-1.5 p-1.5">
              <span class="sr-only">TaskBoard</span>
              <!-- Logo -->
              <img class="h-8 w-auto" src={~p"/images/task.png"} alt="logo" />
            </.link>
            <!-- Close button, show/hide based on slide-over state. -->
            <button
              phx-click={JS.toggle(to: "#mobile-menu")}
              class="-m-2.5 rounded-md p-2.5 text-gray-700"
            >
              <span class="sr-only">Close menu</span>
              <svg
                class="h-6 w-6"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                aria-hidden="true"
              >
                <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>
          </div>
          <div class="mt-6 flow-root">
            <div class="-my-6 divide-y divide-gray-500/10">
              <div class="space-y-2 py-3">
                <a
                  href={~p"/admin/projects"}
                  class="-mx-3 block rounded-lg px-3 py-2 text-base font-semibold leading-7 text-gray-900 hover:bg-gray-50 hover:text-blue-700"
                >
                  SiteAdmin
                </a>
                <a
                  href="#"
                  class="-mx-3 block rounded-lg px-3 py-2 text-base font-semibold leading-7 text-gray-900 hover:bg-gray-50 hover:text-blue-700"
                >
                  ProjectOwner
                </a>
                <a
                  href="#"
                  class="-mx-3 block rounded-lg px-3 py-2 text-base font-semibold leading-7 text-gray-900 hover:bg-gray-50 hover:text-blue-700"
                >
                  Collaborate
                </a>
              </div>
              <div class="space-y-2 py-3">
                <%= if @current_user do %>
                  <%= @current_user.email %>
                  <.link
                    href={~p"/auth/users/settings"}
                    class="-mx-3 block rounded-lg px-3 py-2 text-base font-semibold leading-7 text-gray-900 hover:bg-gray-50 hover:text-blue-700"
                  >
                    Settings
                  </.link>
                  <.link
                    href={~p"/auth/users/log_out"}
                    method="delete"
                    class="-mx-3 block rounded-lg px-3 py-2 text-base font-semibold leading-7 text-gray-900 hover:bg-gray-50 hover:text-blue-700"
                  >
                    Log out
                  </.link>
                <% else %>
                  <.link
                    href={~p"/auth/users/register"}
                    class="-mx-3 block rounded-lg px-3 py-2 text-base font-semibold leading-7 text-gray-900 hover:bg-gray-50 hover:text-blue-700"
                  >
                    Register
                  </.link>
                  <.link
                    href={~p"/auth/users/log_in"}
                    class="-mx-3 block rounded-lg px-3 py-2 text-base font-semibold leading-7 text-gray-900 hover:bg-gray-50 hover:text-blue-700"
                  >
                    Log in
                  </.link>
                <% end %>
              </div>
            </div>
          </div>
        </div>
      </div>
    </header>
    """
  end
end
