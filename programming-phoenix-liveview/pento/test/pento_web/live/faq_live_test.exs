defmodule PentoWeb.FaqLiveTest do
  use PentoWeb.ConnCase

  import Phoenix.LiveViewTest
  import Pento.FaqsFixtures

  @create_attrs %{question: "some question", answer: "some answer"}
  @update_attrs %{question: "some updated question", answer: "some updated answer"}
  @invalid_attrs %{question: nil, answer: nil}

  defp create_faq(_) do
    faq = faq_fixture()
    %{faq: faq}
  end

  describe "Index" do
    setup [:create_faq]

    test "lists all faq", %{conn: conn, faq: faq} do
      {:ok, _index_live, html} = live(conn, ~p"/faq")

      assert html =~ "Listing Faq"
      assert html =~ faq.question
    end

    test "saves new faq", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/faq")

      assert index_live |> element("a", "New Faq") |> render_click() =~
               "New Faq"

      assert_patch(index_live, ~p"/faq/new")

      assert index_live
             |> form("#faq-form", faq: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#faq-form", faq: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/faq")

      html = render(index_live)
      assert html =~ "Faq created successfully"
      assert html =~ "some question"
    end

    test "updates faq in listing", %{conn: conn, faq: faq} do
      {:ok, index_live, _html} = live(conn, ~p"/faq")

      assert index_live |> element("#faq-#{faq.id} a", "Edit") |> render_click() =~
               "Edit Faq"

      assert_patch(index_live, ~p"/faq/#{faq}/edit")

      assert index_live
             |> form("#faq-form", faq: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#faq-form", faq: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/faq")

      html = render(index_live)
      assert html =~ "Faq updated successfully"
      assert html =~ "some updated question"
    end

    test "deletes faq in listing", %{conn: conn, faq: faq} do
      {:ok, index_live, _html} = live(conn, ~p"/faq")

      assert index_live |> element("#faq-#{faq.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#faq-#{faq.id}")
    end
  end

  describe "Show" do
    setup [:create_faq]

    test "displays faq", %{conn: conn, faq: faq} do
      {:ok, _show_live, html} = live(conn, ~p"/faq/#{faq}")

      assert html =~ "Show Faq"
      assert html =~ faq.question
    end

    test "updates faq within modal", %{conn: conn, faq: faq} do
      {:ok, show_live, _html} = live(conn, ~p"/faq/#{faq}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Faq"

      assert_patch(show_live, ~p"/faq/#{faq}/show/edit")

      assert show_live
             |> form("#faq-form", faq: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#faq-form", faq: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/faq/#{faq}")

      html = render(show_live)
      assert html =~ "Faq updated successfully"
      assert html =~ "some updated question"
    end
  end
end
