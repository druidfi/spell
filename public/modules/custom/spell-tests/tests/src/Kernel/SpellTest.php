<?php

declare(strict_types = 1);

namespace Drupal\Tests\spell\Kernel;

use Drupal\KernelTests\KernelTestBase;

/**
 * Tests that Kernel tests can be run.
 *
 * @group spell
 */
class SpellTest extends KernelTestBase {

  /**
   * {@inheritdoc}
   */
  protected static $modules = ['spell'];

  /**
   * Make sure kernel test is ran.
   */
  public function testKernelTest() : void {
    $this->assertEquals('Spell', \Drupal::moduleHandler()->getName('spell'));
  }

}
