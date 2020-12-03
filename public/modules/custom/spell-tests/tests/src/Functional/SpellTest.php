<?php

declare(strict_types = 1);

namespace Drupal\Tests\spell\Functional;

use Drupal\Tests\BrowserTestBase;

/**
 * Tests that functional tests can be run.
 *
 * @group spell
 */
class SpellTest extends BrowserTestBase {

  /**
   * {@inheritdoc}
   */
  protected $defaultTheme = 'stark';

  /**
   * Make sure functional test is run.
   */
  public function testFunctionalTest() : void {
    $this->drupalLogin($this->rootUser);
  }

}
