<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $guarded= [];
    
    public function user(){
        return $this->belongsTo(User::class, 'added_by');
    }
    public function posts()//check have any post exist or not under category
{
    return $this->hasMany(Post::class, 'cat_id');
}
}
