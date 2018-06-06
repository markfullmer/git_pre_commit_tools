<?php

/**
 * @file
 * A helper script to parse a JSON object of Lighthouse.
 */

$report = file_get_contents(__DIR__ . '/lighthouse-report.json');
$report_obj = json_decode($report);
// There's a lot more in the output, but right now we want the score.
// Accessibility is the 3rd element in reportCategories.
$score = $report_obj->reportCategories[2]->score;
// Bash comparisons need an integer.
print (int) number_format($score);
