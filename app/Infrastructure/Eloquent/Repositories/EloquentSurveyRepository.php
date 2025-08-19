<?php

namespace App\Infrastructure\Eloquent\Repositories;

use App\Models\Survey;
use App\Repositories\SurveyRepositoryInterface;
use Illuminate\Support\Collection;

class EloquentSurveyRepository implements SurveyRepositoryInterface
{
    public function find(string $title): ?Survey
    {
        return Survey::find($title);
    }

    public function list(): Collection
    {
        return collect(Survey::query()->where('is_active', true)->get());
    }
}
