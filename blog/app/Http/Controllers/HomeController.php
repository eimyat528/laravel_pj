<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\User;
use App\Mail\PostStored;
use App\Models\Category;
use App\Mail\PostCreated;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Route;
use App\Http\Requests\storePostRequest;
use Illuminate\Support\Facades\Notification;
use App\Notifications\PostCreatedNotification;

class HomeController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth') ;
        // $this->middleware('auth') ->only('create','index');
        // $this->middleware('auth') ->except('create','index');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        // $collection = collect([1,2,3]) ->map(function (string $number){
        //     return $number >2 ;
        // });
        // dd($collection);
        // $posts = Post::pluck('name');
         // dd($posts);
        // dd(config('ap.info.third'));

        // Mail ::raw('Hello World',function($msg){
        //     $msg ->to('hlaing@gmail.com')->subject('AP Index Function');
        // });

         // $user = User::find(1);
        // $user->notify(new PostCreatedNotification());
        // // Notification::send(, new PostCreatedNotification());
        // echo 'noti sent';exit();
       
        // Notification::send(User::find(1), new PostCreatedNotification());
        // echo 'noti sent';exit();
        $data = Post::where('user_id',auth()->id()) ->orderBy('id','desc')->get();
        // $request->session()->flash('status', 'Task was successful!');
        return view('home',compact('data'));   
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::all();
        return view('create',compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request 
     * @return \Illuminate\Http\Response
     */
    public function store(storePostRequest $request)
    {
        $validated = $request->validated();
        // $post = new Post();
        // $post->name = $request->name;
        // $post->description = $request->description;
        // $post->save();
        $post = Post::create($validated +['user_id' =>Auth::user()->id]);
        event (new PostCreated($post));
        // Mail::to('hlaing@gmail.com')->send(new PostCreated());
        return redirect('/posts') -> with('status',config('ap.message.created'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Post $post)
    {
       $this->authorize('view',$post);
        return view('show',compact('post'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Post $post)
    {  
         // if($post->user_id != auth()->id()){
        //     abort(403);
        // }
        $this->authorize('view',$post);
        $categories = Category::all();
        return view('edit',compact('post','categories'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(storePostRequest $request, Post $post)
    {   
        // $post->name = $request->name;
        // $post->description = $request->description;
        // $post->save();
        $validated = $request->validated();
        $post->update($validated);

        return redirect('/posts');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Post $post)
    {
        $post->delete();
        return redirect('/posts');
    }
}