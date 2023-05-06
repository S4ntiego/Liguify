import { ItemList } from '../../components/ItemList'

const Items = ({ items }) => {
  console.log(items)
  return (
    <div className="px-4 sm:px-7 2xl:container 2xl:mx-auto">
      <ItemList />
    </div>
  )
}

export default Items
