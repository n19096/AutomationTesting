from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.by import By


def perform_sign(locator):
    try:
        selib = BuiltIn().get_library_instance('SeleniumLibrary')
        driver = selib.driver
        # driver = selib._current_browser()
        action = ActionChains(driver)
        element = driver.find_element(By.XPATH,  locator)
        action.context_click(element).click_and_hold().move_to_element_with_offset(element, 20, -50).move_by_offset(50, 50).move_by_offset(
            80, -50).move_by_offset(100, 50).release(element).perform()
            # .build()

    except Exception as e:
        print(e)
    finally:
        print("Performed Action")
