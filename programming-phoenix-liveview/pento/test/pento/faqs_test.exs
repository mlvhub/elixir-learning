defmodule Pento.FaqsTest do
  use Pento.DataCase

  alias Pento.Faqs

  describe "faq" do
    alias Pento.Faqs.Faq

    import Pento.FaqsFixtures

    @invalid_attrs %{question: nil, answer: nil}

    test "list_faq/0 returns all faq" do
      faq = faq_fixture()
      assert Faqs.list_faq() == [faq]
    end

    test "get_faq!/1 returns the faq with given id" do
      faq = faq_fixture()
      assert Faqs.get_faq!(faq.id) == faq
    end

    test "create_faq/1 with valid data creates a faq" do
      valid_attrs = %{question: "some question", answer: "some answer"}

      assert {:ok, %Faq{} = faq} = Faqs.create_faq(valid_attrs)
      assert faq.question == "some question"
      assert faq.answer == "some answer"
    end

    test "create_faq/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Faqs.create_faq(@invalid_attrs)
    end

    test "update_faq/2 with valid data updates the faq" do
      faq = faq_fixture()
      update_attrs = %{question: "some updated question", answer: "some updated answer"}

      assert {:ok, %Faq{} = faq} = Faqs.update_faq(faq, update_attrs)
      assert faq.question == "some updated question"
      assert faq.answer == "some updated answer"
    end

    test "update_faq/2 with invalid data returns error changeset" do
      faq = faq_fixture()
      assert {:error, %Ecto.Changeset{}} = Faqs.update_faq(faq, @invalid_attrs)
      assert faq == Faqs.get_faq!(faq.id)
    end

    test "delete_faq/1 deletes the faq" do
      faq = faq_fixture()
      assert {:ok, %Faq{}} = Faqs.delete_faq(faq)
      assert_raise Ecto.NoResultsError, fn -> Faqs.get_faq!(faq.id) end
    end

    test "change_faq/1 returns a faq changeset" do
      faq = faq_fixture()
      assert %Ecto.Changeset{} = Faqs.change_faq(faq)
    end
  end
end
