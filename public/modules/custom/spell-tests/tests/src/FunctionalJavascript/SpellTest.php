<?php

declare(strict_types=1);

namespace Drupal\Tests\spell\FunctionalJavascript;

use Drupal\FunctionalJavascriptTests\WebDriverTestBase;

/**
 * Tests that drupal functional javascript tests can be run.
 *
 * @group spell
 */
class SpellTest extends WebDriverTestBase {

  /**
   * {@inheritdoc}
   */
  protected $defaultTheme = 'stark';

  /**
   * Make sure javascript test is ran.
   */
  public function testJavascriptTest() : void {
    $this->drupalLogin($this->rootUser);
  }

}
