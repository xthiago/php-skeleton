<?php

declare(strict_types=1);

namespace Xthiago;

use PHPUnit\Framework\TestCase;

final class FooTest extends TestCase
{
    public function testCreateFoo() : void
    {
        new Foo();
    }
}
