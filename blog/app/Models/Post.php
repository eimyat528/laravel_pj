<?php

namespace App\Models;

use App\Mail\PostStored;
use Illuminate\Support\Facades\Mail;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Post extends Model
{
    public function categories()
    {
        return $this->belongsTo('App\Models\Category','category_id');
    }
    use HasFactory;
    // protected $fillable = ['name','description'];
     // protected $guarded = [];

    //   protected static function booted()
    //   {
    //       static::created(function($post) {
    //           Mail::to('hlaing@gmail.com')->send(new PostStored($post));
    //       });
    //   }
}
