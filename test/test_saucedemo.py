from playwright.sync_api import Page
import pytest

#@pytest.mark.only_browser("chromium")
def test_title(page: Page):
    #page.goto("https://saucedemo.com")
    page.goto("/")
    #assert page.title() == "Swag Labs 2"
    assert page.title() == "Swag Labs"
    
#test agregar una url base
#@pytest.mark.skip_browser("firefox")    
def test_inventory_page(page: Page):
    page.goto("/inventory.html")
    assert page.inner_text("h3") == "Epic sadface: You can only access '/inventory.html' when you are logged in."