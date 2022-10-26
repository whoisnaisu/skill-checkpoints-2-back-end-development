import { Router } from "express";
import { pool } from "../utils/db.js";

const postRouter = Router();

postRouter.get("/", async (req, res) => {
  const category = req.query.category || "";
  const keywords = req.query.keywords || "";

  let query = "";
  let values = [];

  if (category && keywords) {
    query = `
    select * from posts
    left join post_votes
    on posts.post_id = post_votes.post_id
    where category=$1
    and title ilike $2`;
    values = [category, keywords];
  } else if (keywords) {
    query = `select * from posts
    left join post_votes
    on posts.post_id = post_votes.post_id
    where title ilike $1`;
    values = [keywords];
  } else if (category) {
    query = `select * from posts
    left join post_votes
    on posts.post_id = post_votes.post_id
    where category=$1`;
    values = [category];
  } else {
    query = `select * from posts
    left join post_votes
    on posts.post_id = post_votes.post_id`;
  }

  const results = await pool.query(query, values);

  return res.json({
    data: results.rows,
  });
});

postRouter.get("/:id", async (req, res) => {
  try {
    const postId = req.params.id;
    const result = await pool.query(
      "select * from posts left join post_votes on posts.post_id = post_votes.post_id where post_id=$1",
      [postId]
    );
    return res.json({
      data: result.rows[0],
    });
  } catch (error) {
    console.error(error);
    return "พัง";
  }
});

postRouter.post("/create", async (req, res) => {
  const newPost = {
    ...req.body,
    created_at: new Date(),
    updated_at: new Date(),
  };

  await pool.query(
    `insert into posts (user_id, title, context, category, created_at, updated_at) values ($1, $2, $3, $4, $5, $6)`,
    [
      2,
      newPost.title,
      newPost.context,
      newPost.category,
      newPost.created_at,
      newPost.updated_at,
    ]
  );

  return res.json({
    message: "Post has been created.",
  });
});

postRouter.put("/:id", async (req, res) => {
  const updatedPost = {
    ...req.body,
    updated_at: new Date(),
  };
  const postId = req.params.id;

  await pool.query(
    `update posts
    set title=$1, context=$2, category=$3, updated_at=$4 where post_id=$5
  `,
    [
      updatedPost.title,
      updatedPost.context,
      updatedPost.category,
      updatedPost.updated_at,
      postId,
    ]
  );

  return res.json({
    message: `Post ${postId} has been updated.`,
  });
});

postRouter.delete("/:id", async (req, res) => {
  const postId = req.params.id;
  await pool.query(`delete from posts where post_id=$1`, [postId]);
  return res.json({
    message: `Post ${postId} has been deleted.`,
  });
});

postRouter.get("/:id/comments", async (req, res) => {
  const postId = req.params.id;
  const result = await pool.query(
    "select * from posts left join comments on posts.post_id = comments.post_id where posts.post_id=$1",
    [postId]
  );
  return res.json({
    data: result.rows[0],
  });
});

postRouter.post("/:id/comments", async (req, res) => {
  const postId = req.params.id;
  const newComment = {
    ...req.body,
    created_at: new Date(),
    updated_at: new Date(),
  };

  await pool.query(
    `insert into comments (user_id, post_id, comment, created_at, updated_at) values ($1, $2, $3, $4, $5)`,
    [
      10,
      postId,
      newComment.comment,
      newComment.created_at,
      newComment.updated_at,
    ]
  );

  return res.json({
    message: `Comment at post id ${postId} has been created.`,
  });
});

postRouter.put("/:id/comments", async (req, res) => {
  const postId = req.params.id;
  const updatedComment = {
    ...req.body,
    updated_at: new Date(),
  };

  await pool.query(
    `
    update comments
    set comment=$1, updated_at=$2 where post_id=$3
  `,
    [updatedComment.comment, updatedComment.updated_at, postId]
  );

  return res.json({
    message: `Post ${postId} has been updated.`,
  });
});

postRouter.put("/:id/vote", async (req, res) => {
  const postId = req.params.id;
  const upvote = true || false;
  const result = await pool.query(
    `select * from post_votes update post_votes set upvote=$1 where post_id=$2`,
    [upvote, postId]
  );

  return res.json({
    data: result.rows[0],
  });
});

/* postRouter.put("/:id/vote", async (req, res) => {
  const postId = req.params.id;
  const downvote = 1;
  const result = await pool.query(
    `select * from post_votes update post_votes set= downvote=$1 where post_id=$2`,
    [downvote, postId]
  );

  return res.json({
    data: result.rows[0],
  });
}); */

export default postRouter;
