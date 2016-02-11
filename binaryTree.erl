%% p62 binary-tree
%% ノードのデータ構造　タプル　{node, {key, value, smaller, larger}}
-module(binaryTree).
-export([empty/0, insert/3, lookup/2]).

%% 空ノードを返す
empty() -> {node, 'nil'}.

%% ノード追加
insert(key, val, {node, 'nil'}) ->
  {node, {key, val, {node, 'nil'}, {node, 'nil'}}};
insert(newKey, newVal, {node, {key, val, smaller, larger}})
  %% 追加するキーがそのノードのkeyより小さい場合
  when newKey < key ->
    %% ノードの左側に子ノード追加
    {node, {key, val, insert(newKey, newval, smaller), larger}};
insert(newKey, newVal, {node, {key, val, smaller, larger}})
  %% 追加するキーがそのノードのkeyより小さい場合
  when newKey > key ->
    %% ノードの右側に子ノード追加
    {node, {key, val, smaller, insert(newKey, newVal, larger)}};
insert(key, val, {node, {key, _, smaller, larger}}) ->
  {node, {key, val, smaller, larger}}.

%% ノード検索
lookup(_, {node, 'nil'}) ->
  undefined;
lookup(key, {node, {key, val, _, _}}) ->
  {ok, val};
lookup(key, {node, {nodeKey, _, smaller, _}}) when key < nodeKey ->
  lookup(key, smaller);
lookup(key, {node, {_, _, _, larger}}) ->
  lookup(key, larger).
